//
//  NewsFeedUITests.swift
//  NewsFeedUITests
//
//  Created by PRANOTI KULKARNI on 2/13/21.
//  Copyright © 2021 BetterUp. All rights reserved.
//

import XCTest

class NewsFeedUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableViewInteraction() {
        app.launch()
     
        // Assert that the tableview is displayed
        let newsFeedTableView = app.tables["articlesTableView"]
     
        XCTAssertTrue(newsFeedTableView.exists, "The news feed tableview exists")
     
        // Get an array of cells
        let tableCells = newsFeedTableView.cells
        
        if tableCells.count > 0 {
            let tableCell = tableCells.firstMatch
            XCTAssertTrue(tableCell.exists, "The \(tableCell) cell is in place on the table")
            // Does this actually take us to the next screen
            tableCell.tap()
            
            //once you land on webpage navigate back to previous page testing
            app.navigationBars.buttons.element(boundBy: 0).tap()
         
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
