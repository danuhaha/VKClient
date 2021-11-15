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

    //func addThreeDotsAnimation() {
    //    let threeDots = CAReplicatorLayer()
    //    threeDots.frame = CGRect(x: self.view.bounds.width / 2 - 23, y: self.view.bounds.height / 2 + 20, width: 30, height: 12)
    //    let dot = CALayer()
    //    dot.frame = CGRect(x: 0, y: 0, width: 12, height: 12)
    //    dot.cornerRadius = 6
    //    dot.backgroundColor = UIColor(red: 0.21, green: 0.54, blue: 1.00, alpha: 1.00).cgColor
    //    threeDots.addSublayer(dot)
    //    threeDots.instanceCount = 3
    //    threeDots.instanceTransform = CATransform3DMakeTranslation(18, 0, 0)
    //    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
    //    animation.fromValue = 1.0
    //    animation.toValue = 0.1
    //    animation.duration = 1
    //    animation.repeatCount = .infinity
    //    animation.autoreverses = true
    //    dot.add(animation, forKey: nil)
    //    threeDots.instanceDelay = animation.duration / Double(threeDots.instanceCount)
    //    self.view.layer.addSublayer(threeDots)
    //}

    func animateCloud(frame: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frame.minX + 0.81028 * frame.width, y: frame.minY + 0.39009 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.77271 * frame.width, y: frame.minY + 0.39612 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79766 * frame.width, y: frame.minY + 0.39009 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.78507 * frame.width, y: frame.minY + 0.39210 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.69093 * frame.width, y: frame.minY + 0.22300 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76339 * frame.width, y: frame.minY + 0.32133 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73325 * frame.width, y: frame.minY + 0.25753 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.55572 * frame.width, y: frame.minY + 0.21906 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64862 * frame.width, y: frame.minY + 0.18847 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59879 * frame.width, y: frame.minY + 0.18702 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.29076 * frame.width, y: frame.minY + 0.02004 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51674 * frame.width, y: frame.minY + 0.04650 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39812 * frame.width, y: frame.minY + -0.04260 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.16694 * frame.width, y: frame.minY + 0.44594 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.18340 * frame.width, y: frame.minY + 0.08269 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.12797 * frame.width, y: frame.minY + 0.27339 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.00002 * frame.width, y: frame.minY + 0.72706 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.07290 * frame.width, y: frame.minY + 0.45072 * frame.height), controlPoint2: CGPoint(x: frame.minX + -0.00139 * frame.width, y: frame.minY + 0.57584 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.17212 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00143 * frame.width, y: frame.minY + 0.87829 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.07803 * frame.width, y: frame.minY + 0.99976 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.81028 * frame.width, y: frame.minY + 1.00000 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.69504 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.91505 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.86347 * frame.height))
        path.addCurve(to: CGPoint(x: frame.minX + 0.81028 * frame.width, y: frame.minY + 0.39009 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.52662 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.91505 * frame.width, y: frame.minY + 0.39009 * frame.height))
        path.close()


        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = #colorLiteral(red: 0.2620155811, green: 0.5757498145, blue: 0.9657167792, alpha: 1).cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineCap = .round
        shapeLayer.path = path.cgPath
        shapeLayer.strokeStart = 0

        let startAnimation = CABasicAnimation(keyPath: "strokeStart")
        startAnimation.fromValue = 0
        startAnimation.byValue = 0.7
        startAnimation.toValue = 1

        let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endAnimation.fromValue = 0.3
        endAnimation.toValue = 1
        
        let animation = CAAnimationGroup()
        animation.animations = [startAnimation, endAnimation]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        shapeLayer.add(animation, forKey: "MyAnimation")

        view.layer.addSublayer(shapeLayer)
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if myGroupsArray.isEmpty {
            // addThreeDotsAnimation()
            animateCloud(frame: CGRect(x: self.view.bounds.width / 2 - 55, y: self.view.bounds.height / 2 + 50, width: 100, height: 50))
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
            !theLayer.isKind(of: CAShapeLayer.classForCoder()) }

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
