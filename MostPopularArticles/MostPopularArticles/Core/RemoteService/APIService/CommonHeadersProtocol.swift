//
//  CommonHeadersProtocol.swift
//  MostPopularArticles
//
//  Created by Abnoub Nabil on 12/3/20.
//

import Foundation

protocol CommonHeadersProtocol {
    var commonHeaders: [String: String] { get }
}

protocol CommonParametersProtocol {
	var commonParameters: [String: String] { get }
}

extension CommonHeadersProtocol {
	/**
	add aditional header EX:-
	["Accept": "application/json"]
	["language": ""]
	*/
    var commonHeaders: [String: String] {
        var params = [String: String]()
        params += ["Content-Type": "application/json"]
        return params
    }
}

extension CommonParametersProtocol {
	/**
	add aditional parameter.
	*/
	var commonParameters: [String: String] {
		var params = [String: String]()
		params += ["api-key": Environment.shared.apiKey]
		return params
	}
}
