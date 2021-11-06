//
//  User.swift
//  VKClient
//
//  Created by danuhaha on 30.10.2021.
//

import UIKit

struct User {
    var avatar = UIImage()
    var name = String()
    var status = String()
    var birthday = String()
    var hometown = String()
    var education = String()
    var friends = [Friend]()
    var photos = [UIImage]()
    var posts = [Post]()
}
