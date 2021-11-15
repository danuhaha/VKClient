//
//  ProfileViewController + CreateUser.swift
//  VKClient
//
//  Created by danuhaha on 30.10.2021.
//

import UIKit

extension ProfileViewController {

    func fillFriendsArray() {
        let friend1 = Friend(name: "Lil Uzi", surname: "Vert", avatar: UIImage(named: "liluzi")!, status: "New patek on my wrist", photos: [UIImage(named: "liluzi1")!, UIImage(named: "liluzi2")!, UIImage(named: "liluzi3")!])
        let friend2 = Friend(name: "Travis", surname: "Scott", avatar: UIImage(named: "travis")!, status: "It's lit!", photos: [UIImage(named: "travis1")!, UIImage(named: "travis2")!, UIImage(named: "travis3")!])
        let friend3 = Friend(name: "Playboi", surname: "Carti", avatar: UIImage(named: "carti")!, status: "I wanna go to pluto", photos: [UIImage(named: "carti1")!, UIImage(named: "carti2")!, UIImage(named: "carti3")!, UIImage(named: "carti4")!])
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
    }

    func fillPhotosArray() {
        photosArray = [UIImage(named: "profile1")!, UIImage(named: "profile2")!, UIImage(named: "profile3")!, UIImage(named: "profile4")!, UIImage(named: "profile5")!]
    }

    func fillPostsArray() {
        let post1 = Post(group: Group(title: "Danya Gorin", avatar: UIImage(named: "profile")!), date: "2 часа назад", postText: "Вышел новый альбом Eternal Atake от Lil Uzi Vert!", postImage: UIImage(named: "eternalAtake")!)
        let post2 = Post(group: Group(title: "Danya Gorin", avatar: UIImage(named: "profile")!), date: "5 часов назад", postText: "Новая расцветка Air Jordan 1 от Travis Scott", postImage: UIImage(named: "aj1")!)
        let post3 = Post(group: Group(title: "Danya Gorin", avatar: UIImage(named: "profile")!), date: "вчера", postText: "Вспомним дебютный альбом Playboi Carti", postImage: UIImage(named: "dielit")!)
        postsArray.append(post1)
        postsArray.append(post2)
        postsArray.append(post3)
    }

}
