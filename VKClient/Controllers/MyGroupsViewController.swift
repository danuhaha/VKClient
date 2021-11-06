//
//  MyGroupsViewController.swift
//  VKClient
//
//  Created by Daniil on 16.10.2021.
//

import UIKit

class MyGroupsViewController: UIViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    @IBOutlet weak var tableView: UITableView!

    var myGroupsArray = [Group]()

    func addThreeDotsAnimation() {
        let threeDots = CAReplicatorLayer()
        threeDots.frame = CGRect(x: self.view.bounds.width / 2 - 23, y: self.view.bounds.height / 2 + 20, width: 30, height: 12)
        let dot = CALayer()
        dot.frame = CGRect(x: 0, y: 0, width: 12, height: 12)
        dot.cornerRadius = 6
        dot.backgroundColor = UIColor(red: 0.21, green: 0.54, blue: 1.00, alpha: 1.00).cgColor
        threeDots.addSublayer(dot)
        threeDots.instanceCount = 3
        threeDots.instanceTransform = CATransform3DMakeTranslation(18, 0, 0)
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1.0
        animation.toValue = 0.1
        animation.duration = 1
        animation.repeatCount = .infinity
        animation.autoreverses = true
        dot.add(animation, forKey: nil)
        threeDots.instanceDelay = animation.duration / Double(threeDots.instanceCount)
        self.view.layer.addSublayer(threeDots)
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if myGroupsArray.isEmpty {
            addThreeDotsAnimation()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: customTableViewCell, bundle: nil), forCellReuseIdentifier:
                reuseIdentifierCustom)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.view.layer.sublayers = self.view.layer.sublayers?.filter { theLayer in
            !theLayer.isKind(of: CAReplicatorLayer.classForCoder()) }

    }

    func isItemAlreadyInArray(group: Group) -> Bool {
        return myGroupsArray.contains { sourceGroup in
            sourceGroup.title == group.title
        }
    }

    @IBAction func unwindSegueToMyGroups(segue: UIStoryboardSegue) {
        if segue.identifier == fromAllGroupsToMyGroupsSegue,
            let sourceVC = segue.source as? AllGroupsViewController,
            let selectedGroup = sourceVC.selectedGroup
        {
            if isItemAlreadyInArray(group: selectedGroup) { return }
            self.myGroupsArray.append(selectedGroup)
            tableView.reloadData()
        }
    }
}

extension MyGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCustom, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

        cell.configure(group: myGroupsArray[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "You're not following any groups"
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }

    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(systemName: "person.3.fill")
    }



}
