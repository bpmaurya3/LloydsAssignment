//
//  CompaniesListView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import SwiftUI

struct CompaniesListView: View {
    
    @ObservedObject var viewModel: CompanyListViewModel
    @State private var showingFilterView = false
    
    var body: some View {
        AsyncContentView(source: viewModel) { companies in
            NavigationStack {
                List(viewModel.filteredData) { company in
                    NavigationLink(destination: CompanyDetailsView(viewModel: .init(company: company))) {
                        ListRowView(company: company)
                    }
                }
                .accessibilityIdentifier("companiesList")
                .navigationTitle("Companies")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        // Filter icon button
                        Button(action: {
                            // Show the filter view when clicked
                            showingFilterView.toggle()
                        }) {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill") // Filter icon
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        .accessibilityIdentifier("filterButton")
                    }
                }
                // Filter view sheet
                .sheet(isPresented: $showingFilterView) {
                    FilterView(selectedSector: $viewModel.selectedSector, sectors: viewModel.uniqueSectors)
                        .accessibilityIdentifier("filterSheet")
                }
            }
        }
    }
}

#Preview {
    CompaniesListView(
        viewModel: CompanyListViewModel(
            productsUseCase: CompanyUseCaseImpl(repository: NetwokDataRepository(apiService: APIServiceImpl(networkClient: NetworkManager.shared)))
        )
    )
}
