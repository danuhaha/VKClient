//
//  UserResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit
import RealmSwift
import Realm

@objcMembers
class UserInitialResponse: Object, Codable {
    dynamic var response = List<UserResponse>()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseList = try container.decode([UserResponse].self, forKey: .response)
        response.append(objectsIn: responseList)
        super.init()
    }

    required override init() {
        super.init()
    }
}

@objcMembers
class UserResponse: Object, Codable {
    dynamic var id: Int
    dynamic var firstName: String
    dynamic var lastName: String
    dynamic var birthday: String
    dynamic var avatar: String
    dynamic var status: String
    dynamic var universityName: String
    dynamic var facultyName: String
    dynamic var city: UserCity? = nil

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case birthday = "bdate"
        case avatar = "photo_max"
        case status = "status"
        case universityName = "university_name"
        case facultyName = "faculty_name"
        case city = "city"
    }
}

class UserCity: Object, Codable {
    @objc dynamic var title: String
}
