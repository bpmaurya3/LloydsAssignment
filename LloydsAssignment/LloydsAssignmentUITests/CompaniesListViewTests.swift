//
//  CompaniesListViewTests.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import XCTest

final class CompaniesListViewTests: BaseTests {
    
    func testCompaniesListViewExists() {
        CompanyListScreen()
            .waitUntilReady()
            .verify()
            .tapOnFilterButton()
        FilterScreen()
            .waitUntilReady()
            .verify()
            .tapOnFilter(at: 0)
            .tapOnDoneButton()
    }
    
}
