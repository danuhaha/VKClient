//
//  ProfileViewController + CollectionDataSource.swift
//  VKClient
//
//  Created by danuhaha on 30.10.2021.
//

import UIKit

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.photosCollectionView {
            return  photosArray.count
        } else {
            return friendsArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.photosCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierGalleryCell, for: indexPath) as? GalleryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.configure(image: self.photosArray[indexPath.item])
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierFriendCell, for: indexPath) as? FriendCell else {return UICollectionViewCell()}
            
            cell.configure(friend: self.friendsArray[indexPath.item])
            
            return cell
        }
    }
}
