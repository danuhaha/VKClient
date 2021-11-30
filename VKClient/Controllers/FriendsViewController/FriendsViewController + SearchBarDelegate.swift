//
//  FriendsViewController + SearchBarDelegate.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

extension FriendsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.friendsArray = self.savedFriendsArray
        } else {
            self.friendsArray = self.savedFriendsArray
            self.friendsArray = self.friendsArray.filter({ friendsItem in
                friendsItem.firstName.lowercased().contains(searchText.lowercased()) || friendsItem.lastName.lowercased().contains(searchText.lowercased())
            })
        }
        self.tableView.reloadData()
    }
}
