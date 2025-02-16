//
//   APIServiceTests.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import Foundation
import Testing

@testable import LloydsAssignment

final class APIServiceTests {
    
    @Test
    func testFetchCompaniesSuccess() async throws {
        let mockNetworkClient = MockNetworkClient()
        let apiService = APIServiceImpl(networkClient: mockNetworkClient)
        
        // When: Call the method to fetch companies
        let companies = try await apiService.fetchDataFromJSON(filename: "mockData")
        
        // Then: Validate the results
        #expect(companies.count == 2)
        #expect(companies[0].name == "Apple Inc.")
        #expect(companies[1].name == "Tesla Inc.")
    }
    
    @Test
    func testFetchCompaniesTimeout() async throws {
        let mockNetworkClient = MockNetworkClient()
        let apiService = APIServiceImpl(networkClient: mockNetworkClient)
        
        // When: Call the method to fetch companies
        let timeout: TimeInterval = 1.0  // Timeout in seconds
        let companies = try await withTimeout(timeout) {
            try await apiService.fetchDataFromJSON(filename: "mockData")
        }
        
        // Then: Validate the results
        #expect(companies.count == 2)
        #expect(companies[0].name == "Apple Inc.")
        #expect(companies[1].name == "Tesla Inc.")
    }
    
    // Helper function to handle timeout logic
    func withTimeout<T>(_ timeout: TimeInterval, operation: @escaping () async throws -> T) async throws -> T {
        let startTime = Date()
        
        while Date().timeIntervalSince(startTime) < timeout {
            do {
                return try await operation()  // Attempt to run the async operation
            } catch {
                // If you encounter an error, you can retry or break the loop
                // For now, we just rethrow the error after trying
                continue
            }
        }
        // If the operation doesn't complete within the timeout, throw a timeout error
        throw APIServiceError.timeout("Test timed out.")
    }
    
    @Test
    func testFetchCompaniesFailure() async throws {
        // Arrange
        let mockNetworkClient = MockNetworkClient()
        let apiService = APIServiceImpl(networkClient: mockNetworkClient)
        
        // Act & Assert: Expecting an error to be thrown when the file is not found
        do {
            // Trying to fetch data with an invalid file name
            let _ = try await apiService.fetchDataFromJSON(filename: "InvalidMockCompanies")
            // If no error is thrown, the test should fail
            assert(false, "Expected an error to be thrown when the file is not found")
        } catch {
            #expect(error as! APIServiceError == .invalidUrl)
        }
    }
}

