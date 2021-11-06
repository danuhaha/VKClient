//
//  FriendsViewController + FillFriendsArray.swift
//  VKClient
//
//  Created by danuhaha on 25.10.2021.
//

import UIKit

extension FriendsViewController {
    
    func fillFriendsArray() {
        let friend1 = Friend(name: "Lil Uzi", surname: "Vert", avatar: UIImage(named: "liluzi")!, status: "New patek on my wrist", photos: [UIImage(named: "liluzi1")!,UIImage(named: "liluzi2")!,UIImage(named: "liluzi3")!])
        let friend2 = Friend(name: "Travis", surname: "Scott", avatar: UIImage(named: "travis")!, status: "It's lit!", photos: [UIImage(named: "travis1")!,UIImage(named: "travis2")!,UIImage(named: "travis3")!])
        let friend3 = Friend(name: "Playboi", surname: "Carti", avatar: UIImage(named: "carti")!, status: "I wanna go to pluto", photos: [UIImage(named: "carti1")!,UIImage(named: "carti2")!,UIImage(named: "carti3")!,UIImage(named: "carti4")!])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray = friendsArray.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }
}
