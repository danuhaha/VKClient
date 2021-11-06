//
//  CustomTableViewCell.swift
//  VKClient
//
//  Created by Daniil on 14.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var avatarView: AvatarView!

    @IBOutlet weak var button: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarView.avatarImageView.layer.cornerRadius = 25
        avatarView.layer.cornerRadius = 25
        //avatarView.layer.shadowColor = avatarView.shadowColor.cgColor
        //avatarView.layer.shadowRadius = CGFloat(avatarView.shadowRadius)
        //avatarView.layer.shadowOpacity = avatarView.shadowOpacity
        //avatarView.layer.shadowOffset = avatarView.shadowOffset
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        avatarView.avatarImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    func configure(friend: Friend) {
        avatarView.avatarImageView.image = friend.avatar
        titleLabel.text = friend.name + " " + friend.surname
        subtitleLabel.text = friend.status
    }

    func configure(group: Group) {
        avatarView.avatarImageView.image = group.avatar
        titleLabel.text = group.title
        subtitleLabel.text = group.followers
    }

    @IBAction func pressAvatar(_ sender: Any) {
        UIView.animate(withDuration: 0.07, delay: 0, options: .curveEaseIn, animations: {
            self.avatarView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        }, completion: { _ in
                UIView.animate(withDuration: 0.07, delay: 0, options: .curveEaseOut, animations: {
                    self.avatarView.transform = CGAffineTransform.identity
                })
            })
    }

}
