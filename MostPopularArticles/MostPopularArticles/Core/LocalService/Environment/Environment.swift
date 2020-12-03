//
//  EnvironmentService.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import Foundation

struct Environment {
	static let shared = Environment()

	var newYorkTimeUrlString: String {
		"https://api.nytimes.com/svc/mostpopular/v2/viewed/"
	}

	var apiKey: String {
		"EFGHXkoCg87UypyViDSvX8E1Box0rDdT"
	}

}
