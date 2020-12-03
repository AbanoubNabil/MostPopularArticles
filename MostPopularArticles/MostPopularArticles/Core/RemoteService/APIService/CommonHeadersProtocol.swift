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

extension CommonHeadersProtocol {
	/**
	add aditional parameter EX:-
	["Accept": "application/json"]
	["language": ""]
	*/
    var commonHeaders: [String: String] {
        var params = [String: String]()
        params += ["Content-Type": "application/json"]
        return params
    }
}
