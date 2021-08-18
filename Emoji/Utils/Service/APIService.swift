//
//  APIService.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation
import Moya

enum Service {
    case emojis
    case users(username: String)
    case repo
}

extension Service: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com") ?? URL(fileURLWithPath: "https://api.github.com")
    }
    
    var path: String {
        switch self {
        case .emojis:
            return "/emojis"
        case .users(let username):
            return "/users/\(username)"
        case .repo:
            return "/users/apple/repos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .emojis, .users, .repo:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .emojis, .users, .repo:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .emojis, .users, .repo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
