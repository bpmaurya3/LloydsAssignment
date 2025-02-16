//
//  CompanyListViewModelTests.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import Testing
import Combine

@testable import LloydsAssignment
import Foundation

final class CompanyListViewModelTests {
    
    var viewModel: CompanyListViewModel!
    var mockUseCase: MockCompanyUseCase!
    var cancellables: Set<AnyCancellable>!
    
    @Test
    func testLoadSuccess() async throws {
        // Arrange
        mockUseCase = MockCompanyUseCase()
        viewModel = CompanyListViewModel(productsUseCase: mockUseCase)
        
        // Act: Load companies
        viewModel.load()
        
        try await Task.sleep(for: .milliseconds(100))

        // Assert: Ensure the state is 'loaded' and data is populated
        //assert(viewModel.state is LoadingState.loaded)
        #expect(viewModel.filteredData.count == 2)
        #expect(viewModel.filteredData[0].name == "Apple Inc.")
        #expect(viewModel.filteredData[1].name == "Tesla Inc.")
    }
    
    
    @Test
    func testUniqueSectors() {
        // Arrange
        mockUseCase = MockCompanyUseCase()
        viewModel = CompanyListViewModel(productsUseCase: mockUseCase)
        
        // Act: Load companies
        viewModel.updateData(mockUseCase.mockCompanies)
        
        // Assert: Ensure unique sectors are returned correctly
        #expect(viewModel.uniqueSectors.count == 2)
        #expect(viewModel.uniqueSectors.contains("Technology"))
        #expect(viewModel.uniqueSectors.contains("Consumer Cyclical"))
    }
}
