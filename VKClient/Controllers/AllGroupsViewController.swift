//
//  AllGroupsViewController.swift
//  VKClient
//
//  Created by Daniil on 16.10.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var allGroupsArray = [Group]()

    var selectedGroup: Group?

    func fillAllGroupsArray() {
        let group1 = Group(title: "Fast Food Music", followers: "670.7k followers", avatar: UIImage(named: "ffm")!)
        let group2 = Group(title: "Zloy SoundCloud", followers: "30.1k followers", avatar: UIImage(named: "zloy")!)
        allGroupsArray.append(group1)
        allGroupsArray.append(group2)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fillAllGroupsArray()

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}

        cell.configure(group: allGroupsArray[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = allGroupsArray[indexPath.row]
        performSegue(withIdentifier: fromAllGroupsToMyGroupsSegue, sender: allGroupsArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
