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

class UserInitialResponse: Object, Codable {
    @objc dynamic let response: UserResponse? = nil
}

class UserResponse: Object, Codable {
    @objc dynamic let id: Int
    @objc dynamic let firstName: String
    @objc dynamic let lastName: String
    @objc dynamic let birthday: String
    @objc dynamic let avatar: String
    @objc dynamic let status: String
    @objc dynamic let universityName: String
    @objc dynamic let facultyName: String
    @objc dynamic let city: UserCity
}

class UserCity: Object, Codable {
    @objc dynamic let title: String
}
