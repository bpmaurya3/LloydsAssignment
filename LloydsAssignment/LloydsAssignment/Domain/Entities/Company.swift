//
//  Company.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

// MARK: - Main Company Model
struct Company: Identifiable, Decodable {
    let id: String
    let name: String
    let type: String
    let symbol: String
    let currentValue: Double
    let percentageChange: Double
    let description: String
    let timestamp: String
    let image: String
    let logoImage: String
    let sector: String
    let historicalData: [HistoricalData]
}

// MARK: - Historical Data Model
struct HistoricalData: Decodable {
    let date: String
    let value: Double
}
