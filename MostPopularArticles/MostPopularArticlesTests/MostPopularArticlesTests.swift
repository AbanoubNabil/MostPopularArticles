//
//  MostPopularArticlesTests.swift
//  MostPopularArticlesTests
//
//  Created by Abanoub Nabil on 12/3/20.
//

import XCTest
@testable import MostPopularArticles

class MostPopularArticlesTests: XCTestCase {

	var interactor: NYTMostViewdArticlesInteractor?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


	override func setUp() {
		super.setUp()
		interactor = NYTMostViewdArticlesInteractor()
	}

	func testFetchNewsWithFailure() throws {

		let presenter = NYTMostViewdArticlesPresenter(interface: NYTMostViewdArticlesViewController(), interactor: NYTMostViewdArticlesInteractor(), router: NYTMostViewdArticlesRouter())

		XCTAssertEqual(presenter.newsCount, 0, "articles should be empty before the data task runs")

		presenter.getMostViewdNews(period: .month)

		XCTAssertGreaterThan(presenter.newsCount, 0, "parsed from response")
	}

}
