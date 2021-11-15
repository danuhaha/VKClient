//
//  GalleryViewController.swift
//  VKClient
//
//  Created by Daniil on 16.10.2021.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var photos = [UIImage]()

    var fullScreenView: UIView?
    var galleryView: GallerylView?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: galleryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: reuseIdentifierGalleryCell)
    }

}


