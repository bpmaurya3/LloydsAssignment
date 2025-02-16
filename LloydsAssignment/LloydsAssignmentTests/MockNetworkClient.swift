//
//  MockNetworkClient.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import Foundation
import Testing

@testable import LloydsAssignment

final class MockNetworkClient: NetworkClient {
    var mockData: Data?
    var mockError: Error?
    
    func performRequest<T: Decodable>(urlString: String, method: HTTPMethod, parameters: [String: Any]?, body: Data?, headers: [NetworkHeader: String]?, responseType: T.Type) async throws -> T {
        if let error = mockError {
            throw error
        }
        if let data = mockData {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
        throw APIServiceError.httpError(statusCode: 404)
    }
}
