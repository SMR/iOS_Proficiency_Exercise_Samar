//
//  NetworkMangerTests.swift
//  iOS_Proficiency_Exercise_SamarTests
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import XCTest
@testable import iOS_Proficiency_Exercise_Samar
class NetworkMangerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testReachability() throws {
        let internetConnectionStatus = NetworkManager().isNetworkConnectionAvailable()
        XCTAssertTrue(internetConnectionStatus)
    }

}
