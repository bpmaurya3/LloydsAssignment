//
//  FilterScreen.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 17/02/25.
//

import XCTest

class FilterScreen: BaseScreen {
    lazy var filterList = app.collectionViews["filterList"]
    lazy var doneButton = app.buttons["DoneButton"]
    lazy var cancelButton = app.buttons["CancelButton"]
    
    @discardableResult
    func waitUntilReady() -> Self {
        _ = filterList.waitForExistence(timeout: 10) // Increase timeout if needed
        return self
    }
    @discardableResult
    func verify() -> Self {
        XCTAssertTrue(filterList.exists, "Filter list not found")
        XCTAssertTrue(doneButton.exists, "Done button not found")
        XCTAssertTrue(cancelButton.exists, "Cancel button not found")

        return self
    }
    
    @discardableResult
    func tapOnDoneButton() -> Self {
        doneButton.tap()
        return self
    }
    
    @discardableResult
    func tapOnFilter(at index: Int) -> Self {
        filterList.cells.element(boundBy: index).firstMatch.tap()
        return self
    }
    
    @discardableResult
    func tapOnCancelButton() -> Self {
        cancelButton.tap()
        return self
    }
}
