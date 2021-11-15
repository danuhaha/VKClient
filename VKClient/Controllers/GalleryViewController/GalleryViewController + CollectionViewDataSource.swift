//
//  GalleryViewController + CollectionViewDataSource.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierGalleryCell, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(image: self.photos[indexPath.item])


        return cell
    }

}
