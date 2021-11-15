//
//  GalleryViewController + CollectionViewDelegate.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showFullScreenView(self.photos)
        galleryView?.currentIndex = indexPath.item
        galleryView?.mainImageView.image = photos[indexPath.item]
        galleryView?.customPageView.currentPage = indexPath.item
    }
}
