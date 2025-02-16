//
//  FilterViewTests.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 17/02/25.
//

import XCTest

final class FilterViewTests: BaseTests {
    
    func testApplyFilterView() {
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
    
    func testApplyThenClearFilterView() {
        let companyListScreen = CompanyListScreen()
            .waitUntilReady()
        
        companyListScreen
            .verify()
            .tapOnFilterButton()
        
        let filterscreen = FilterScreen().waitUntilReady()
        
        filterscreen
            .verify()
            .tapOnFilter(at: 0)
            .tapOnDoneButton()
        
        companyListScreen
            .tapOnFilterButton()
        
        filterscreen
            .tapOnCancelButton()
        
    }
}
