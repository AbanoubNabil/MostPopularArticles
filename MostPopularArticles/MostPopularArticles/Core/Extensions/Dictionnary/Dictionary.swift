//
//  Dictionary.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//


import Foundation

public func += <KeyType, ValueType>(left: inout [KeyType: ValueType], right: [KeyType: ValueType]) {
	for (key, value) in right {
		left.updateValue(value, forKey: key)
	}
}
