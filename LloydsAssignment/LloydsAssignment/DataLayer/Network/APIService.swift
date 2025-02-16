//
//  APIService.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import Foundation

protocol APIService {
    // Method for fetching Comapanies
    func fetchComapanies(queryParams: [String: Any]?) async throws -> [Company]
    // From mockfile
    func fetchDataFromJSON(filename: String) async throws -> [Company]
}

struct APIServiceImpl: APIService {
    
    private let networkClient: NetworkClient
    private let baseURL = "https://67aee7d89e85da2f020eba06.mockapi.io/"
    
    init(networkClient: NetworkClient = NetworkManager.shared) {
        self.networkClient = networkClient
    }
    
    // Fetch posts with GET method and dynamic headers
    func fetchComapanies(queryParams: [String: Any]? = nil) async throws -> [Company] {
        let endpoint = "/companies"
        let url = constructURL(endpoint: endpoint, queryParams: queryParams)
        
        // Define headers using the enum
        let headers: [NetworkHeader: String] = [
            .contentType: "application/json"
        ]
        
        // Perform network request with all required parameters
        let posts: [Company] = try await networkClient.performRequest(
            urlString: url,
            method: .get,  // Use the HTTPMethod enum for the request method
            parameters: queryParams, // Pass query parameters if any
            body: nil, // No body for GET request
            headers: headers, // Include the headers
            responseType: [Company].self // The expected response type (array of Comapaniy)
        )
        
        return posts
    }
}

extension APIServiceImpl {
    // Your async function to fetch data from a JSON file
    func fetchDataFromJSON(filename: String) async throws -> [Company] {
        // Get the file URL for the local JSON file in the app's bundle
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw APIServiceError.invalidUrl
        }
        
        // Fetch and read data from the file asynchronously
        let data = try await readFileAsync(url: url)
        
        // Decode the JSON data into the User model
        let decoder = JSONDecoder()
        do {
            let companies = try decoder.decode([Company].self, from: data)
            return companies
        } catch {
            throw APIServiceError.decodingError(error.localizedDescription)
        }
    }

    // Helper function to read data from the file asynchronously
    private func readFileAsync(url: URL) async throws -> Data {
        // Simulating asynchronous reading of data from the file (in reality, we use `async` for network requests)
        try await Task.sleep(nanoseconds: 500_000_000) // Optional: mimic delay
        
        return try Data(contentsOf: url)
    }
}

extension APIServiceImpl {
    // Helper function to build the URL with query parameters
    private func constructURL(endpoint: String, queryParams: [String: Any]? = nil) -> String {
        var url = baseURL + endpoint
        if let queryParams = queryParams {
            var queryItems = [URLQueryItem]()
            for (key, value) in queryParams {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            
            var components = URLComponents(string: url)
            components?.queryItems = queryItems
            url = components?.url?.absoluteString ?? url
        }
        return url
    }
}
