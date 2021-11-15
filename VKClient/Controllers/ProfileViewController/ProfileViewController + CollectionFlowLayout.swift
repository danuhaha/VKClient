//
//  ProfileViewController + CollectionFlowLayout.swift
//  VKClient
//
//  Created by danuhaha on 30.10.2021.
//

import UIKit

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.photosCollectionView {
            let collectionWidth = collectionView.bounds.width
            let spacing = CGFloat(5)
            let cellWidth = (collectionWidth - 4 * spacing) / 3
            return CGSize(width: cellWidth, height: cellWidth)
        } else {
            let collectionWidth = collectionView.bounds.width
            let cellWidth = collectionWidth / 5 + 4
            return CGSize(width: cellWidth, height: cellWidth + 38)
        }
    }
}
