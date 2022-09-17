//
//  User.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//


import Foundation

// MARK: - User
struct User: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let login: String?
    let id: Int?
    let avatarURL: String?
    let isfavourited: Bool? = false
    let htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case isfavourited
        case htmlURL = "html_url"
    }
}
