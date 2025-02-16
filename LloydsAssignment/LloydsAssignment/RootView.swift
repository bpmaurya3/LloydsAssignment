//
//  RootView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import SwiftUI

struct RootView: View {

    var body: some View {
       Group {
           // View that displays the list of companies
           CompaniesListView(
               viewModel: CompanyListViewModel(
                   productsUseCase: CompanyUseCaseImpl(
                       // The use case that contains the business logic for fetching the company data
                       // Note:- For local data can be use `LocalDataRepository`
                       repository: NetwokDataRepository(
                           apiService: APIServiceImpl(
                               networkClient: NetworkManager.shared
                           )
                       )
                   )
               )
           )
        }
    }
}

#Preview {
    RootView()
}
