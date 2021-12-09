//
//  AllGroupsViewController.swift
//  VKClient
//
//  Created by Daniil on 16.10.2021.
//

import UIKit
import Alamofire

class AllGroupsViewController: UIViewController {

    let session = Session.instance

    @IBOutlet weak var tableView: UITableView!

    var allGroupsArray = [Group]()

    var selectedGroup: Group?

    func getImage(from url: String) -> UIImage? {
        var image: UIImage?
        guard let imageURL = URL(string: url) else { return nil }

        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        image = UIImage(data: imageData)

        return image
    }

    func fillAllGroupsArray(_ groupsInitialResponse: GroupsInitialResponse) {

        let groupsCount = groupsInitialResponse.response?.items.count
        let groups = groupsInitialResponse.response?.items

        for i in 0...groupsCount! - 1 {

            guard let avatar = getImage(from: groups![i].avatar) else { return }

            allGroupsArray.append(Group(title: groups![i].title, followers: "\(groups![i].followers) followers", avatar: avatar))
        }
    }

    func getGroupsInitialResponse() {

        AF.request("https://api.vk.com/method/groups.get", parameters: [
            "v": "5.131",
            "count": "5",
            "extended": "1",
            "fields": "members_count",
            "access_token": session.token
            ]).responseData { data in
            guard let data = data.value else { return }

            do {
                guard let response = try? JSONDecoder().decode(GroupsInitialResponse.self, from: data) else { return }
                self.fillAllGroupsArray(response)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getGroupsInitialResponse()
        
        tableView.register(UINib(nibName: customTableViewCell, bundle: nil), forCellReuseIdentifier:
                reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

        cell.configure(group: allGroupsArray[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = allGroupsArray[indexPath.row]
        performSegue(withIdentifier: fromAllGroupsToMyGroupsSegue, sender: allGroupsArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
