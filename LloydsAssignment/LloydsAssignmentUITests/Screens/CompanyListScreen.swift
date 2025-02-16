//
//  CompanyListScreen.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import XCTest

class CompanyListScreen: BaseScreen {
    lazy var companiesList = app.collectionViews["companiesList"]
    lazy var filterButton = app.buttons["filterButton"]
    
    @discardableResult
    func waitUntilReady() -> Self {
        _ = companiesList.waitForExistence(timeout: 10) // Increase timeout if needed
        return self
    }
    @discardableResult
    func verify() -> Self {
        XCTAssertTrue(companiesList.exists, "Companies list not found")
        XCTAssertTrue(filterButton.exists, "Filter button not found")
        return self
    }
    
    @discardableResult
    func tapOnFilterButton() -> CompanyListScreen {
        filterButton.tap()
        return self
    }
    
    @discardableResult
   func tapOnCompany(at index: Int) -> CompanyListScreen {
       companiesList.cells.element(boundBy: index).firstMatch.tap()
        return self
    }
}
