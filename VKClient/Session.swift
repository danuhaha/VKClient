//
//  Session.swift
//  VKClient
//
//  Created by danuhaha on 17.11.2021.
//

import UIKit

class Session {
    
    var token: String = ""
    var userId: Int = 0
    
    private init(){}
    
    static let instance = Session()
    
}
