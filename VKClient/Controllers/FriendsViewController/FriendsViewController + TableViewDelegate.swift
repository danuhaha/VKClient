//
//  FriendsViewController + TableViewDelegate.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

extension FriendsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromFriendsToGallerySegue, sender: arrayByLetter(letter: arrayLetter(sourceArray: friendsArray)[indexPath.section], sourceArray: friendsArray)[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
