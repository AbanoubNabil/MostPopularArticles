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
	
    init(interface: NYTMostViewdArticlesViewProtocol, interactor: NYTMostViewdArticlesInteractorProtocol?, router: NYTMostViewdArticlesWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension NYTMostViewdArticlesPresenter: NYTMostViewdArticlesPresenterProtocol {
	
	var screenTitle: String {
		locallizer.screenTitle ?? ""
	}
	
	var searchPlaceeHolder: String {
		locallizer.searchPlaceholder ?? ""
	}
	
	
	func getMostViewdNews() {
		view?.startLoadingAnimation()
		interactor?.fetchNewsWith(period: .week)
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

extension NYTMostViewdArticlesPresenter{
	
	var newsCount: Int{
		return self.articles?.count ?? 0
	}
	
	func getArticle(at index: Int) -> NewsArticle? {
		return self.articles?[index]
	}
}

