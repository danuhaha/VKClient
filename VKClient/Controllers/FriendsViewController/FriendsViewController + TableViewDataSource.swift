//
//  FriendsViewController + TableViewDatabase.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  arrayByLetter(letter: arrayLetter(sourceArray: friendsArray)[section], sourceArray: friendsArray).count //friendsArray.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return   arrayLetter(sourceArray: friendsArray).count //friendsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        //cell.configure(friend: friendsArray[indexPath.row])
        cell.configure(friend: arrayByLetter(letter: arrayLetter(sourceArray: friendsArray)[indexPath.section], sourceArray: friendsArray)[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(arrayLetter(sourceArray: friendsArray)[section].uppercased())"
    }

    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return arrayLetter(sourceArray: friendsArray).map { item in
            return item.uppercased()
        }
        
    }
}
