//
//  NYTimesNewsService.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import Foundation

class NYTimesNewsService: APIService<NYTimesNewsEndPoint> {
	func getNYTimesNews(period: Period, completion: @escaping (Result<NYTimesNewsResponse, Error>) -> Void) {
		sendRequest(target: .getNYTimesNews(period: period), completion: completion)
	}
}
