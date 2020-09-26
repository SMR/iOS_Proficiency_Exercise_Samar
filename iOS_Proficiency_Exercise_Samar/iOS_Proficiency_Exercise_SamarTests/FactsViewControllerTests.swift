//
//  FactsViewControllerTests.swift
//  iOS_Proficiency_Exercise_SamarTests
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import XCTest
@testable import iOS_Proficiency_Exercise_Samar
class FactsViewControllerTests: XCTestCase {
    var viewController: FactsViewController!
    var tableView: UITableView!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = FactsViewController()

           // Initializing view of FactsViewController
           _ = viewController.view

           tableView = viewController.tableView
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        tableView = nil
    }
    func testTableViewIsNotNilAfterViewDidLoad() {
      XCTAssertNotNil(tableView)
    }

    func testTableCellIsRegisteredAfterViewDodLoad() {
      let cell = tableView.dequeueReusableCell(withIdentifier: FactsCell.reuseIdentifier)
      XCTAssertNotNil(cell)
      XCTAssertTrue(cell is FactsCell)
    }

    func testViewDidLoadShouldSetTableViewDataSource() {
      XCTAssertNotNil(tableView.dataSource)
      XCTAssertTrue(tableView.dataSource is FactsViewController)
    }

    func testViewDidLoad_ShouldSetTableViewDelegate() {
      XCTAssertNotNil(tableView.delegate)
      XCTAssertTrue(tableView.delegate is FactsViewController)
    }

    func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject() {
      XCTAssertEqual(tableView.dataSource as? FactsViewController, tableView.delegate as? FactsViewController)
    }
    
    func testServiceResponse(){
       let bundle = Bundle(for: type(of: self))
        guard let path  = bundle.url(forResource: "ServiceResponse", withExtension: "json") else {
            XCTFail("File Not Found:ServiceResponse.josn")
            return
        }
        do {
          let data = try Data(contentsOf: path, options: .mappedIfSafe)
          guard let factsObject = try? JSONDecoder().decode(FactsModel.self, from: data) else { return }

          XCTAssertNotNil(factsObject)
          XCTAssertNotNil(factsObject.rows)

          if let rows = factsObject.rows {
            XCTAssertEqual(rows.count, 14)
          }
        } catch {
          // handle error
        }
    
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
extension FactsViewControllerTests{
    class MockDataSource:NSObject,UITableViewDataSource{
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
          }

          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
       }
    }
}
