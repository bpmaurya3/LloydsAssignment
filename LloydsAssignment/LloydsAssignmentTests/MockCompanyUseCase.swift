//
//  MockCompanyUseCase.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import Testing

@testable import LloydsAssignment

// Mock for the CompanyUseCase
final class MockCompanyUseCase: CompanyUseCase {
    
    var shouldReturnError = false
    
    var mockCompanies: [Company] = [
        Company(
            id: "1",
            name: "Apple Inc.",
            type: "Stock",
            symbol: "AAPL",
            currentValue: 145.32,
            percentageChange: 1.24,
            description: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California.",
            timestamp: "2024-06-19T10:00:00Z",
            image: "https://picsum.photos/200/300?random=8",
            logoImage: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg",
            sector: "Technology",
            historicalData: [
                HistoricalData(date: "2023-06-12", value: 144.1),
                HistoricalData(date: "2023-06-11", value: 143.85),
                HistoricalData(date: "2023-06-10", value: 144.25),
                HistoricalData(date: "2023-06-09", value: 145),
                HistoricalData(date: "2023-06-08", value: 144.75)
            ]
        ),
        Company(
            id: "2",
            name: "Tesla Inc.",
            type: "Stock",
            symbol: "TSLA",
            currentValue: 722.34,
            percentageChange: -2.45,
            description: "Tesla Inc. is an American electric vehicle and clean energy company.",
            timestamp: "2024-06-19T10:00:00Z",
            image: "https://picsum.photos/200/300?random=9",
            logoImage: "https://upload.wikimedia.org/wikipedia/commons/a/a0/Tesla_logo.png",
            sector: "Consumer Cyclical",
            historicalData: [
                HistoricalData(date: "2023-06-12", value: 144.1),
                HistoricalData(date: "2023-06-11", value: 143.85),
                HistoricalData(date: "2023-06-10", value: 144.25),
                HistoricalData(date: "2023-06-09", value: 145),
                HistoricalData(date: "2023-06-08", value: 144.75)
            ]
        )

    ]

    func fetchCompanies() async throws -> [Company] {
        if shouldReturnError {
            throw APIServiceError.httpError(statusCode: 500)
        } else {
            return mockCompanies
        }
    }
}
