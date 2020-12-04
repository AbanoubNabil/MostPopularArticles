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
	func getMostViewdNews()
	func fetchNewsSuccessful(news: [NewsArticle])
	func fetchNewsFailure(error: Error)
	var newsCount: Int { get }
	var screenTitle: String { get }
	var searchPlaceeHolder: String { get }
	func getArticle(at index: Int) -> NewsArticle?
	func didTapedCell(at index: Int)
}

// MARK: Interactor -
protocol NYTMostViewdArticlesInteractorProtocol: class {

	var presenter: NYTMostViewdArticlesPresenterProtocol? { get set }
	func fetchNewsWith(period: Period)

}

// MARK: View -
protocol NYTMostViewdArticlesViewProtocol: class {

	var presenter: NYTMostViewdArticlesPresenterProtocol? { get set }
	func startLoadingAnimation()
	func stopLoadingAnimation()
	func reloadDate()

}
