//
//  Avatars.swift
//  Emoji
//
//  Created by Any Ambria on 16/08/21.
//

import Foundation

struct Avatars: Codable {
    let login: String?
    let id: Int?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
}
