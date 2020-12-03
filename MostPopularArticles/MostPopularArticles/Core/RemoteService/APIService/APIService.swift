//
//  APIService.swift
//  MostPopularArticles
//
//  Created by Abnoub Nabil on 12/3/20.
//

import Foundation

class APIService<T> where T: EndPoint {}

extension APIService {
	/**
	this method uses URLSession native framework to consume the APIs
	Parameters:-
	target:- is generic of EndPoint type.
	completion:- is escaping closure, accept Swift result as parameter and return void.
	*/
    func sendRequest<R: Codable>(target: T, completion: @escaping (Swift.Result<R, Error>) -> Void) {
        URLSession.shared.dataTask(with: target.urlRequest) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
            }

            if let nyError = (error as? NSError)?.toEAError {
                completion(Result.failure(nyError))
                return
            }

            guard let data = data else {
                completion(Result.failure(error ?? NYError.unknown))
                return
            }

            guard let responseModel = try? JSONDecoder().decode(R.self, from: data) else {
                completion(Result.failure(NYError.parsing))
                return
            }

            completion(Result.success(responseModel))

        }.resume()
    }
}
