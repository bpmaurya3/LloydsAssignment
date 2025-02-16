//
//  CompaniesRepository.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

protocol DataRepository {
    func fetchCompanies() async throws -> [Company]
}

struct NetwokDataRepository : DataRepository {
    private let apiService : APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchCompanies() async throws -> [Company] {
        return try await apiService.fetchComapanies(queryParams: nil)
    }
}

struct LocalDataRepository: DataRepository {
    private let apiService : APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchCompanies() async throws -> [Company] {
        return try await apiService.fetchDataFromJSON(filename: "companies")
    }
}
