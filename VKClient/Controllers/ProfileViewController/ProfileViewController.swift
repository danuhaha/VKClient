//
//  ProfileViewController.swift
//  VKClient
//
//  Created by danuhaha on 26.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    var friendsArray = [Friend]()
    var photosArray = [UIImage]()
    var postsArray = [Post]()
    var user = User()
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var avatarImageView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    @IBOutlet weak var postsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillFriendsArray()
        fillPhotosArray()
        fillPostsArray()
        
        user = User(avatar: UIImage(named: "profile")!, name: "Danya Gorin", status: "лил бебра", birthday: "4 March 2002", hometown: "St. Petersburg", education: "MSU, Physics faculty", friends: friendsArray, photos: photosArray)
        
        avatarImage.image = user.avatar
        avatarImage.layer.cornerRadius = 60
        avatarImageView.layer.cornerRadius = 60
        
        nameLabel.text = user.name
        statusLabel.text = user.status
        birthdayLabel.text = user.birthday
        hometownLabel.text = user.hometown
        educationLabel.text = user.education
        
        friendsCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        friendsCollectionView.register(UINib(nibName: friendCell, bundle: nil), forCellWithReuseIdentifier: reuseIdentifierFriendCell)
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(UINib(nibName: galleryCollectionViewCell, bundle: nil),forCellWithReuseIdentifier: reuseIdentifierGalleryCell)
        
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: newsCell, bundle: nil), forCellReuseIdentifier: reuseIdentifierNewsCell)
        
        postsTableView.isScrollEnabled = false
        photosCollectionView.isScrollEnabled = false
        
    }
    
 
}
