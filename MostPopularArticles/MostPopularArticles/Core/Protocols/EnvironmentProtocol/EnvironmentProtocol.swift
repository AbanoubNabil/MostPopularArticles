//
//  EnvironmentProtocol.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import Foundation

protocol EnvironmentProtocol {
	var newYorkTimeUrlString: String { get }
}

extension EnvironmentProtocol {
	var newYorkTimeUrlString: String {
		Environment.shared.newYorkTimeUrlString
	}
}
