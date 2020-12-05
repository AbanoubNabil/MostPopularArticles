//
//  NYTMostViewdArticlesProtocols.swift
//  MostPopularArticles
//
//  Created Abanoub Nabil on 12/3/20.
//  Copyright © 2020 Abanoub Nabil. All rights reserved.
//

import Foundation

// MARK: Wireframe -
protocol NYTMostViewdArticlesWireframeProtocol: class {
	func goTo(route: NYTMostViewdArticlesRouter.NewsListRouter)
}

// MARK: Presenter -
protocol NYTMostViewdArticlesPresenterProtocol: class {
	func getMostViewdNews(period: Period)
	func fetchNewsSuccessful(news: [NewsArticle])
	func fetchNewsFailure(error: Error)
	func getArticle(at index: Int) -> NewsArticle?
	func didTapedCell(at index: Int)
	func filterContentForSearchText(_ searchText: String)
	var newsCount: Int { get }
	var screenTitle: String { get }
	var searchPlaceeHolder: String { get }
	var localization: NewsLisrLocalization { get }

}

// MARK: Interactor -
protocol NYTMostViewdArticlesInteractorProtocol: class {

	var presenter: NYTMostViewdArticlesPresenterProtocol? { get set }
	func fetchNewsWith(period: Period)

}

// MARK: View -
protocol NYTMostViewdArticlesViewProtocol: class {

	var presenter: NYTMostViewdArticlesPresenterProtocol? { get set }
	var isFiltering: Bool { get }
	func startLoadingAnimation()
	func stopLoadingAnimation()
	func reloadDate()

}
