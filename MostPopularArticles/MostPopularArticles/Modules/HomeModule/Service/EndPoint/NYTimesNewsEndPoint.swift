//
//  NYTimesNewsEndPoint.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import Foundation
enum NYTimesNewsEndPoint {
	case getNYTimesNews(period: Period)
}

extension NYTimesNewsEndPoint: EndPoint {
	var baseUrl: String {
		newYorkTimeUrlString
	}

	var path: String {
		switch self {
		case let .getNYTimesNews(period):
			return period.rawValue
		}
	}

	var queryParameters: [String: String?] {
		return commonParameters
	}

	var headers: [String: String] {
		[:]
	}

	var method: RequestHTTPMethod {
		.get
	}

	var bodyParmaters: [String: Any?] {
		[:]
	}

	var authorizationType: AuthorizationType {
		.basic
	}
}
