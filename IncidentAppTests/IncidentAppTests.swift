//
//  IncidentAppTests.swift
//  IncidentAppTests
//
//  Created by Shubham Kumar on 12/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import XCTest
@testable import IncidentApp

class IncidentAppTests: XCTestCase {
        var validation:Validation?
    override func setUp() {
          validation = Validation()
        
        // Put setup code here. This method is called before the invocation oeach test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        validation = nil
       
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
       let boolName = validation?.validateName(name: "johnkerry")
       XCTAssertEqual(boolName!, true, "name is not valid");
        
        let boolPassword = validation?.validatePassword(password: "john@0012")
          XCTAssertEqual(boolPassword!, true, "password is not valid");
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
