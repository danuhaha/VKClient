//
//  GalleryCollectionViewCell.swift
//  VKClient
//
//  Created by Daniil on 22.10.2021.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var likeView: LikeView!

    @IBOutlet weak var photoImageView: UIImageView!


    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        likeView.liked = false
        likeView.likeImage = UIImage(systemName: "heart")
        likeView.likeCount = 0
    }


    func configure(image: UIImage) {
        photoImageView.image = image
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        likeView.layer.cornerRadius = 3
    }



}
