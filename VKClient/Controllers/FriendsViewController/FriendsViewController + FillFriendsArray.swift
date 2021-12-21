//
//  FriendsViewController + FillFriendsArray.swift
//  VKClient
//
//  Created by danuhaha on 25.10.2021.
//

import UIKit
import Alamofire
import RealmSwift

extension FriendsViewController {

    func getImage(from url: String) -> UIImage? {
        var image: UIImage?
        guard let imageURL = URL(string: url) else { return nil }

        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        image = UIImage(data: imageData)

        return image
    }

    func fillFriendsArray() {

        do {
            let realm = try Realm()
            let friendsItems = realm.objects(FriendsItems.self)

            let friendsCount = friendsItems.count
            let friends = friendsItems

            for i in 0...friendsCount - 1 {
                guard let avatar = getImage(from: friends[i].avatar) else { return }
                if friends[i].status != "" {
                    friendsArray.append(Friend(firstName: friends[i].firstName, lastName: friends[i].lastName, avatar: avatar, status: friends[i].status, photos: [UIImage()], id: friends[i].id))
                } else {
                    friendsArray.append(Friend(firstName: friends[i].firstName, lastName: friends[i].lastName, avatar: avatar, status: friends[i].domain, photos: [UIImage()], id: friends[i].id))
                }
            }

            friendsArray = friendsArray.sorted { $0.firstName.lowercased() < $1.firstName.lowercased() }
            savedFriendsArray = friendsArray
        } catch {
            print(error)
        }

    }

    func getFriendsInitialResponse() {

        AF.request("https://api.vk.com/method/friends.get", parameters: [
            "v": "5.131",
            "lang": "en",
            "order": "hints",
            "count": "50",
            "fields": "photo_200,status,domain",
            "access_token": session.token
            ]).responseData { [weak self] data in
            guard let data = data.value else { return }

            do {
                guard let response = try? JSONDecoder().decode(FriendsInitialResponse.self, from: data) else { return }

                self?.saveFriends(Array(response.response!.items))

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    func saveFriends(_ friendsItems: [FriendsItems]) {
        do {
            let realm = try Realm()
            let oldFriendsItems = realm.objects(FriendsItems.self)
            realm.beginWrite()
            realm.delete(oldFriendsItems)
            realm.add(friendsItems)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }

}







