//
//  NYTMostViewdArticlesInteractor.swift
//  MostPopularArticles
//
//  Created Abanoub Nabil on 12/3/20.
//  Copyright © 2020 Abanoub Nabil. All rights reserved.
//

import UIKit

class NYTMostViewdArticlesInteractor {

    weak var presenter: NYTMostViewdArticlesPresenterProtocol?
	let service = NYTimesNewsService()
}

// MARK: - Presenter To Interactor Protocol

extension NYTMostViewdArticlesInteractor: NYTMostViewdArticlesInteractorProtocol {
	func fetchNewsWith(period: Period) {
		service.getNYTimesNews(period: period) { [weak self] response in
			DispatchQueue.main.async {
				switch response {
				case let .success(parsedResponse):
					print(parsedResponse)
					if let news = parsedResponse.results {
						self?.presenter?.fetchNewsSuccessful(news: news)
					}
				case let .failure(error):
					print(error)
					if let error = error as? NYError {
						switch error {
						case .authentication:
							self?.presenter?.fetchNewsFailure(error: error)
						default:
							print("Failure")
						}
					}
				}
			}
		}
	}
}
