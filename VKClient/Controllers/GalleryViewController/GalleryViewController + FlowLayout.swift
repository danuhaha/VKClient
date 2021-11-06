//
//  GalleryViewController + FlowLayout.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        let spacing = CGFloat(5)
        let cellWidth = (collectionWidth - 4*spacing)/3
        return CGSize(width: cellWidth, height: cellWidth)

    }
}
