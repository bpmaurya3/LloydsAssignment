//
//  CompanyDetailsViewModel.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import Foundation

final class CompanyDetailsViewModel: ObservableObject {
    var company: Company
    
    init(company: Company) {
        self.company = company
    }
    
    func getHistoricalData() -> [HistoricalData] {
        company.historicalData
    }
}
