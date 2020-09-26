//
//  FactsCellTests.swift
//  iOS_Proficiency_Exercise_SamarTests
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import XCTest
@testable import iOS_Proficiency_Exercise_Samar

class FactsCellTests: XCTestCase {
    var viewController: FactsViewController!
    var tableView: UITableView!
    var indexPath: IndexPath!
    var dataSourceProvider: MockDataSource! = MockDataSource()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = FactsViewController()

        // Initializing view of FactsViewController
        _ = viewController.view
        tableView = viewController.tableView
        dataSourceProvider = MockDataSource()
        tableView.dataSource = dataSourceProvider
        indexPath = IndexPath(row: 0, section: 0)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        tableView = nil
        indexPath = nil
        dataSourceProvider = nil
    }
    func testConfigWithRowDataAndSetLabelText() {
     
      
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

}

extension FactsCellTests {
    class MockDataSource:NSObject, UITableViewDataSource {
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
      }
    }
}
