//
//  FantasyNameGeneratorUITests.swift
//  FantasyNameGeneratorUITests
//
//  Created by Field Employee on 5/12/21.
//

import XCTest

class FantasyNameGeneratorUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    func testMasculineButton() throws {
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
