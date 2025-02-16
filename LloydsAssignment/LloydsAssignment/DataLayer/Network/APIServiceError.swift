//
//  APIServiceError.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

enum APIServiceError: Error, Equatable {
    case invalidUrl
    case encodingError(String)
    case httpError(statusCode: Int)
    case decodingError(String)
    case networkError(String)
    case timeout(String)
    case downloadingError(String)
}
