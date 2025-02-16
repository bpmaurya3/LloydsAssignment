//
//  DetailsViewScreen.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 17/02/25.
//

import XCTest

class DetailsViewScreen: BaseScreen {
    
    lazy var headerView = app.scrollViews["DetailsHeaderView"]
    lazy var collapsibleTextView = app.staticTexts["CollapsibleTextView"]
    lazy var historicalDataView = app.staticTexts["HistoricalDataView"]
    
    @discardableResult
    func waitUntilReady() -> Self {
        _ = headerView.waitForExistence(timeout: 10) // Increase timeout if needed
        return self
    }
    
    @discardableResult
    func verify() -> Self {
        XCTAssertTrue(headerView.exists, "Header view not found")
        XCTAssertTrue(collapsibleTextView.exists, "CollapsibleTextView view not found")
        XCTAssertTrue(historicalDataView.exists, "HistoricalDataView view not found")

        return self
    }
}
