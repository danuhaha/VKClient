//
//  FriendCell.swift
//  VKClient
//
//  Created by danuhaha on 01.11.2021.
//

import UIKit

class FriendCell: UICollectionViewCell {


    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        avatarImage.layer.cornerRadius = avatarView.bounds.height / 2
        avatarView.layer.cornerRadius = avatarView.bounds.height / 2
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImage.image = nil
        nameLabel.text = nil
        surnameLabel.text = nil
    }

    func configure(friend: Friend) {
        avatarImage.image = friend.avatar
        nameLabel.text = friend.firstName
        surnameLabel.text = friend.lastName
    }

    @IBAction func pressAvatar(_ sender: Any) {
        UIView.animate(withDuration: 0.07, delay: 0, options: .curveEaseIn, animations: {
            self.avatarView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }) { _ in
            UIView.animate(withDuration: 0.07, delay: 0, options: .curveEaseOut, animations: {
                self.avatarView.transform = CGAffineTransform.identity
            })
        }
    }

}
