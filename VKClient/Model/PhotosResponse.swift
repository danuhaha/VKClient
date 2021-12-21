//
//  PhotosResponse.swift
//  VKClient
//
//  Created by danuhaha on 29.11.2021.
//

import Foundation
import UIKit
import RealmSwift
import Realm

class PhotosInitialResponse: Object, Codable {
    @objc dynamic var response: PhotosResponse? = nil
}

@objcMembers
class PhotosResponse: Object, Codable {
    dynamic var count: Int = 0
    dynamic var items = List<PhotosItems>()

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        count = try container.decode(Int.self, forKey: .count)
        let itemsList = try container.decode([PhotosItems].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }

    required override init() {
        super.init()
    }
}

@objcMembers
class PhotosItems: Object, Codable {
    dynamic var likes: PhotosLikes? = nil
    dynamic var sizes = List<PhotosSizes>()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        likes = try container.decode(PhotosLikes.self, forKey: .likes)
        let sizesList = try container.decode([PhotosSizes].self, forKey: .sizes)
        sizes.append(objectsIn: sizesList)
        super.init()
    }

    required override init() {
        super.init()
    }
}

class PhotosLikes: Object, Codable {
    @objc dynamic var count: Int
}

class PhotosSizes: Object, Codable {
    @objc dynamic var url: String
    @objc dynamic var type: String
}
