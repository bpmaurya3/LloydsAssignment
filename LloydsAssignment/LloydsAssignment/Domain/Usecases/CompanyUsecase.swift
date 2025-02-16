//
//  CompanyUsecase.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

protocol CompanyUseCase {
    func fetchCompanies() async throws -> [Company]
}

class CompanyUseCaseImpl: CompanyUseCase {
    
    private let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    func fetchCompanies() async throws -> [Company] {
        return try await repository.fetchCompanies()
    }
}
