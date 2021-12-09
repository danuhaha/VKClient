//
//  GroupsResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit
import RealmSwift
import Realm

class GroupsInitialResponse: Object, Codable {
    @objc dynamic var response: GroupsResponse? = nil
}

@objcMembers
class GroupsResponse: Object, Codable {
    dynamic var count: Int = 0
    dynamic let items = List<GroupsItems>()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        let itemsList = try container.decode([GroupsItems].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }

    required override init() {
        super.init()
    }
}

@objcMembers
class GroupsItems: Object, Codable {
    dynamic var id: Int
    dynamic var title: String
    dynamic var avatar: String
    dynamic var followers: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case avatar = "photo_200"
        case followers = "members_count"
    }
}
