//
//  CompanyDetailsView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import SwiftUI

struct CompanyDetailsView: View {
    @ObservedObject var viewModel: CompanyDetailsViewModel
    
    var body: some View {
        ScrollView { // Wrap the entire content in a ScrollView
            VStack(spacing: 20) {
                let companyDetails = viewModel.company
                // Display product details
                DetailsHeaderView(company: companyDetails)
                    .accessibilityIdentifier("DetailsHeaderView")
                // Description
                CollapsibleTextView(description: companyDetails.description)
                    .accessibilityIdentifier("CollapsibleTextView")
                // Historical Data
                HistoricalDataView(historicalData: companyDetails.historicalData)
                    .accessibilityIdentifier("HistoricalDataView")
            }
            .padding()
        }
    }
}
