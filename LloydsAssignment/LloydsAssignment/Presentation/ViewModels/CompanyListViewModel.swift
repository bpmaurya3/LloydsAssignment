//
//  Untitled.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import Foundation
import Combine

class CompanyListViewModel: LoadableObject {
    
    @Published private(set) var state = LoadingState<[Company]>.idle
    @Published var selectedSector: String? = nil
    @Published var filteredData: [Company] = []
    private var allData: [Company] = [] // The unfiltered data
    
    private let getProductsUseCase: CompanyUseCase
        
    private var cancellables = Set<AnyCancellable>()
    
    init(productsUseCase: CompanyUseCase) {
        self.getProductsUseCase = productsUseCase
        
        // Subscribe to updates in the source state and data
        $selectedSector
            .sink { [weak self] sector in
                self?.applyFilter(sector: sector)
            }
            .store(in: &cancellables)
    }
    
    func load() {
        self.state = .loading
        Task { @MainActor in
            do {
                let posts = try await getProductsUseCase.fetchCompanies()
                self.state = .loaded(posts)
                self.updateData(posts)
            } catch {
                self.state = .failed(error)
            }
        }
    }
    
    // Filter the Companies data based on the selected sector
    func applyFilter(sector: String?) {
        if case .loaded = state {
            filteredData = filterData(allData, sector: sector)  // Apply filtering to the data
        }
    }
    
    func filterData(_ data: [Company], sector: String? = nil) -> [Company] {
        if let sector = sector {
            return data.filter { $0.sector == sector }
        } else {
            return data
        }
    }
    
    func updateData(_ data: [Company]) {
        allData = data
        filteredData = filterData(allData)  // Apply filter after the data is loaded
    }
    
    // Extract unique sectors from the stocks data
    var uniqueSectors: [String] {
        let sectors = Set(allData.map { $0.sector }) // Using Set to get unique sectors
        return Array(sectors).sorted() // Return a sorted array of unique sectors
    }
}
