//
//  BaseTests.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 17/02/25.
//

import XCTest

class BaseTests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Launch the app
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }
}
