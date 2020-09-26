//
//  FatcsModelTests.swift
//  iOS_Proficiency_Exercise_SamarTests
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import XCTest
@testable import iOS_Proficiency_Exercise_Samar
class FatcsModelTests: XCTestCase {

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
    func testFactsModelStructure() throws {
      let noFactsModel = FactsModel(title: "About Canada", rows: [])

      XCTAssertNotNil(noFactsModel)
      XCTAssertEqual(noFactsModel.title, "About Canada")
      XCTAssertNotNil(noFactsModel.rows)
      XCTAssertEqual(noFactsModel.rows!.count, 0)

      let sampleTitle = "Beavers"
      let sampleDescription = """
                              Beavers are second only to humans in their ability
                              to manipulate and change their environment. They can measure up to
                              1.3 metres long. A group of beavers is called a colony.
                              """
      let sampleImageURL = """
                            https://upload.wikimedia.org/wikipedia/commons/thumb/6
                            /6b/American_Beaver.jpg/220px-American_Beaver.jpg
                            """

      let factsModel = FactsModel(
        title: "About Canada",
        rows: [
          Row(title: sampleTitle, rowDescription: sampleDescription, imageHref: sampleImageURL)
        ]
      )

      XCTAssertNotNil(factsModel)
      XCTAssertEqual(factsModel.rows!.count, 1)
      XCTAssertEqual(factsModel.rows![0].title, sampleTitle)
      XCTAssertEqual(factsModel.rows![0].rowDescription, sampleDescription)
      XCTAssertEqual(factsModel.rows![0].imageHref, sampleImageURL)
    }

}
