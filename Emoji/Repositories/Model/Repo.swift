//
//  Repo.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation

struct Repo: Codable {
    let id: Int?
    let fullName: String?
    let repoPrivate: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case repoPrivate = "private"
    }
}
