//
//  GroupsResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit

struct GroupsInitialResponse: Codable {
    let response: GroupsResponse
}

struct GroupsResponse: Codable {
    let count: Int
    let items: [GroupsItems]
}

struct GroupsItems: Codable {
    let id: Int
    let title: String
    let avatar: String
    let followers: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case avatar = "photo_200"
        case followers = "members_count"
    }
}
