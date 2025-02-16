//
//  ConpanyDetailsTests.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 17/02/25.
//

import XCTest

final class ConpanyDetailsTests: BaseTests {
    func testDetailView() {
        CompanyListScreen()
            .waitUntilReady()
            .verify()
            .tapOnCompany(at: 0)
        DetailsViewScreen()
            .waitUntilReady()
            .verify()
    }
    
}
