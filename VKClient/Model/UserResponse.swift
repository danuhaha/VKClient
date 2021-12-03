//
//  UserResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit

struct UserInitialResponse: Codable {
    let response: UserResponse
}

struct UserResponse: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let birthday: String
    let avatar: String
    let status: String
    let universityName: String
    let facultyName: String
    let city: UserCity
}

struct UserCity: Codable {
    let title: String
}
