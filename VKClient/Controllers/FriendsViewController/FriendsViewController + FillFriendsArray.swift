//
//  FriendsViewController + FillFriendsArray.swift
//  VKClient
//
//  Created by danuhaha on 25.10.2021.
//

import UIKit
import Alamofire

extension FriendsViewController {

    func getImage(from url: String) -> UIImage? {
        var image: UIImage?
        guard let imageURL = URL(string: url) else { return nil }

        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        image = UIImage(data: imageData)

        return image
    }

    func fillFriendsArray(_ friendsInitialResponse: FriendsInitialResponse) {

        let friendsCount = friendsInitialResponse.response.items.count
        let friends = friendsInitialResponse.response.items

        for i in 0...friendsCount - 1 {
            guard let avatar = getImage(from: friends[i].avatar) else { return }
            if friends[i].status != "" {
                friendsArray.append(Friend(firstName: friends[i].firstName, lastName: friends[i].lastName, avatar: avatar, status: friends[i].status, photos: [UIImage()], id: friends[i].id))
            } else {
                friendsArray.append(Friend(firstName: friends[i].firstName, lastName: friends[i].lastName, avatar: avatar, status: friends[i].domain, photos: [UIImage()], id: friends[i].id))
            }
        }

        friendsArray = friendsArray.sorted { $0.firstName.lowercased() < $1.firstName.lowercased() }
    }

    func getFriendsInitialResponse() {

        AF.request("https://api.vk.com/method/friends.get", parameters: [
            "v": "5.131",
            "lang": "en",
            "order": "hints",
            "count": "50",
            "fields": "photo_200,status,domain",
            "access_token": session.token
            ]).responseData { data in
            guard let data = data.value else { return }

            do {
                guard let response = try? JSONDecoder().decode(FriendsInitialResponse.self, from: data) else { return }
                self.fillFriendsArray(response)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}







