//  NuaSolutionsTests.swift
//  NuaSolutionsTests
//  Created by Анастасия Набатова on 1/4/24.

import XCTest
@testable import NuaSolutions

final class NuaSolutionsTests: XCTestCase {
    
    private var service: RecipeService!
    
    override func setUp() {
        service = RecipeService()
    }
    
    func testFetchRecipes() {
        let service = RecipeService(session: URLSession.shared)
        let expectation = XCTestExpectation(description: "Fetching recipes data successfully")
        guard let request = ApiRequest().makeRequest(with: ApiConstants.query) else {
            return
        }
        service.fetchRecipe(request: request) { result in
            switch result {
            case .success(let recipes):
                if let hits = recipes.hits, !hits.isEmpty {
                    XCTAssert(true, "Recipes data fetched successfully")
                } else {
                    XCTFail("No recipes data received")
                }
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
