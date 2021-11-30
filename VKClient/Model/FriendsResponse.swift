//
//  FriendsResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit


struct FriendsInitialResponse: Codable {
    let response: FriendsResponse
}

struct FriendsResponse: Codable {
    let count: Int
    let items: [FriendsItems]
}

struct FriendsItems: Codable {
    let firstName: String
    let lastName: String
    let id: Int
    let avatar: String
    let status: String
    let domain: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id = "id"
        case avatar = "photo_200"
        case status = "status"
        case domain = "domain"
    }
}
