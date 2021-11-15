//
//  ProfileViewController + PostsDelegate.swift
//  VKClient
//
//  Created by danuhaha on 30.10.2021.
//

import UIKit

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
