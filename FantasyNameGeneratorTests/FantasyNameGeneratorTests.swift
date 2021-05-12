//
//  FantasyNameGeneratorTests.swift
//  FantasyNameGeneratorTests
//
//  Created by Field Employee on 4/2/21.
//

import XCTest
@testable import FantasyNameGenerator

class FantasyNameGeneratorTests: XCTestCase {

    func testNameSetup(){
        let value = GeneratorViewController()
        
        value.nameSetup()
        
    }
    
    func testPrintName(){
        var alertName: String?
        alertName = "Drakthar Ugon the Dark Slayer"
        
        XCTAssertEqual(alertName, "Drakthar Ugon the Dark Slayer")
    }

}
