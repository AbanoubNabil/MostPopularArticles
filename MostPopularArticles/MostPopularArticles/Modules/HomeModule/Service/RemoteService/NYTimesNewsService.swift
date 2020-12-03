//
//  NYTimesNewsService.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import Foundation
enum period: Int {
	case day = 1
	case week = 7
	case month = 30
}
class NYTimesNewsService: APIService<NYTimesNewsEndPoint> {
	func getNYTimesNews(period: Int, completion: @escaping (Result<NYTimesNewsResponse, Error>) -> Void) {
		sendRequest(target: .getRequestdetails(requestId: id), completion: completion)
	}
}
