//
//  AccessTokenAuthorizable.swift
//  MostPopularArticles
//
//  Created by Abnoub Nabil on 12/3/20.
//

import Foundation

protocol AccessTokenAuthorizable {
    /// Represents the authorization header to use for requests.
    var authorizationType: AuthorizationType { get }
}

// MARK: - AuthorizationType

/// An enum representing the header to use with an `AccessTokenPlugin`
public enum AuthorizationType {
    /// No header.
    case none

    /// The `"Basic"` header.
    case basic

    /// Custom header implementation.
    case custom(String)

    public var value: String? {
        switch self {
        case .none: return nil
        case .basic: return "Basic"
        case let .custom(customValue): return customValue
        }
    }
}

extension AccessTokenAuthorizable {
    var authentications: [String: String] {
        switch authorizationType {
        case .custom:
            return [:]
        case .none:
            return [:]
        case .basic:
            return ["api-key": "EFGHXkoCg87UypyViDSvX8E1Box0rDdT"]
        }
    }
}
