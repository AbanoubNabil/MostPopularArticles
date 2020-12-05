//
//  NYTMostViewdArticlesPresenter.swift
//  MostPopularArticles
//
//  Created Abanoub Nabil on 12/3/20.
//  Copyright © 2020 Abanoub Nabil. All rights reserved.
//

import UIKit

class NYTMostViewdArticlesPresenter {

    weak private var view: NYTMostViewdArticlesViewProtocol?
    var interactor: NYTMostViewdArticlesInteractorProtocol?
    private let router: NYTMostViewdArticlesWireframeProtocol

	private var articles: [NewsArticle]?
	private var locallizer  = NewsLisrLocalization()
	private var filteredArticles: [NewsArticle]?

    init(interface: NYTMostViewdArticlesViewProtocol, interactor: NYTMostViewdArticlesInteractorProtocol?, router: NYTMostViewdArticlesWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

// MARK: delegate methods

extension NYTMostViewdArticlesPresenter: NYTMostViewdArticlesPresenterProtocol {

	var localization: NewsLisrLocalization {
		locallizer
	}

	var screenTitle: String {
		locallizer.screenTitle ?? ""
	}

	var searchPlaceeHolder: String {
		locallizer.searchPlaceholder ?? ""
	}

	func getMostViewdNews(period: Period) {
		view?.startLoadingAnimation()
		interactor?.fetchNewsWith(period: period)
	}

	func fetchNewsSuccessful(news: [NewsArticle]) {
		view?.stopLoadingAnimation()
		self.articles = news
		view?.reloadDate()
	}

	func fetchNewsFailure(error: Error) {
		view?.stopLoadingAnimation()
	}
}

// MARK: Table Data Source Methods
extension NYTMostViewdArticlesPresenter {

	var newsCount: Int {
		view?.isFiltering ?? false ? self.filteredArticles?.count ?? 0 : self.articles?.count ?? 0
	}

	func getArticle(at index: Int) -> NewsArticle? {
		view?.isFiltering ?? false ? self.filteredArticles?[index] : self.articles?[index]
	}

	func didTapedCell(at index: Int) {
		if let article = filteredArticles?[index], view?.isFiltering ?? false {
			router.goTo(route: .articleDetails(article: article))
		}

		if let article = articles?[index], !(view?.isFiltering ?? false ) {
			router.goTo(route: .articleDetails(article: article))
		}

	}
}

// MARK: Search Methods
extension NYTMostViewdArticlesPresenter {

	func filterContentForSearchText(_ searchText: String) {
		self.filteredArticles = articles?.filter({($0.title?.lowercased().contains(searchText.lowercased()) ?? false)})
		view?.reloadDate()
	}
}
