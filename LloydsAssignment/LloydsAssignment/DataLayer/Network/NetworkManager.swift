//
//  NetworkSerc=vice.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum NetworkHeader: String {
    case contentType = "Content-Type"
    case custom = "X-Custom-Header"
    
    // Method to get dynamic values for headers
    func value(for token: String? = nil) -> String? {
        switch self {
        case .contentType:
            return "application/json"
        case .custom:
            return "Some Custom Value"
        }
    }
}

public protocol NetworkClient {
    // Generic function to perform network requests and return decoded data
    func performRequest<T: Decodable>(
        urlString: String,
        method: HTTPMethod,
        parameters: [String: Any]?,
        body: Data?,
        headers: [NetworkHeader: String]?,
        responseType: T.Type
    ) async throws -> T
}

public class NetworkManager: NetworkClient {
    
    public static let shared = NetworkManager()
    
    private init() {}
    
    public func performRequest<T: Decodable>(
        urlString: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        body: Data? = nil,
        headers: [NetworkHeader: String]? = nil,
        responseType: T.Type = T.self
    ) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw APIServiceError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        
        // Add all headers to the request
        for (key, value) in headers ?? [:] {
            request.setValue(value, forHTTPHeaderField: key.rawValue)
        }
        
        // Set body for POST/PUT requests
        if method == .post || method == .put, let body = body {
            request.httpBody = body
        } else if let parameters = parameters, (method == .post || method == .put) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        
        // Perform the request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Check for success
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw APIServiceError.httpError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }
        
        // Decode the response data
        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(T.self, from: data)
            
            return decodedResponse
        } catch {
            throw APIServiceError.decodingError(error.localizedDescription)
        }
    }
}
