//
//  Encoder.swift
//  MostPopularArticles
//
//  Created by Abanoub Nabil on 12/3/20.
//

import Foundation

protocol Encoder {}

extension Encoder {
	/**
	this methos encodes Codable object using JSONEncoder.
	parameters:-
	model:- any encodable object.
	return:-
	Dictionary of the encoded  model.
	*/
    func encodeModel<T>(model: T) -> [String: Any] where T: Encodable {
        let data = try? JSONEncoder().encode(model)
        do {
            return try (JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String: Any]) ?? [:]
        } catch {
            print(error.localizedDescription)
            return [:]
        }
    }
}
