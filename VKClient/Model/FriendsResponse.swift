//
//  FriendsResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit
import RealmSwift
import Realm

class FriendsInitialResponse: Object, Codable {
    @objc dynamic var response: FriendsResponse? = nil
}
@objcMembers
class FriendsResponse: Object, Codable {
    dynamic var count: Int = 0
    dynamic let items = List<FriendsItems>()

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        let itemsList = try container.decode([FriendsItems].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }

    required override init() {
        super.init()
    }
}

class FriendsItems: Object, Codable {
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var id: Int
    @objc dynamic var avatar: String
    @objc dynamic var status: String
    @objc dynamic var domain: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id = "id"
        case avatar = "photo_200"
        case status = "status"
        case domain = "domain"
    }
}
