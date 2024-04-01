//  NuaSolutionsUITests.swift
//  NuaSolutionsUITests
//  Created by Анастасия Набатова on 1/4/24.

import XCTest

final class NuaSolutionsUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testRecipeSearch() throws {
        let app = XCUIApplication()
        app.launch()
        let searchBar = app.searchFields["Search recipes"]
        XCTAssertTrue(searchBar.exists)
        searchBar.tap()
        searchBar.typeText("Salad")
        let searchButton = app.buttons["Search"]
        XCTAssertTrue(searchButton.exists)
        searchButton.tap()
        
        sleep(5)
        
        let tableView = app.tables.firstMatch
        XCTAssertTrue(tableView.exists)
        
        let cells = tableView.cells
        XCTAssertTrue(cells.count > 0)
    }
}
