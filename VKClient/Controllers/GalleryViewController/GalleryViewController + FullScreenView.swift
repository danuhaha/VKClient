//
//  GalleryViewController + FullScreenView.swift
//  VKClient
//
//  Created by danuhaha on 08.11.2021.
//

import UIKit

extension GalleryViewController: UIGestureRecognizerDelegate {

    func showFullScreenView(_ photos: [UIImage]) {
        if fullScreenView == nil {
            fullScreenView = UIView(frame: self.view.bounds)
        }

        self.view.addSubview(fullScreenView!)

        fullScreenView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapRecognizer.delegate = self
        fullScreenView?.addGestureRecognizer(tapRecognizer)

        if galleryView == nil {
            galleryView = GallerylView(frame: CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: self.view.frame.width, height: self.view.frame.width))
        }
        galleryView?.setImages(images: photos)
        fullScreenView?.addSubview(galleryView!)
        galleryView?.isUserInteractionEnabled = true
        galleryView!.translatesAutoresizingMaskIntoConstraints = false
        galleryView!.centerXAnchor.constraint(equalTo: self.fullScreenView!.centerXAnchor).isActive = true
        galleryView!.centerYAnchor.constraint(equalTo: self.fullScreenView!.centerYAnchor).isActive = true
        galleryView!.widthAnchor.constraint(equalTo: self.fullScreenView!.widthAnchor).isActive = true
        galleryView!.heightAnchor.constraint(equalTo: self.fullScreenView!.widthAnchor).isActive = true
    }

    @objc func tap(_ sender: UITapGestureRecognizer) {
        guard let fullScreenView = self.fullScreenView
            else { return }
        galleryView?.removeFromSuperview()
        galleryView = nil
        fullScreenView.removeFromSuperview()
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let touchedView = touch.view, let gestureView = gestureRecognizer.view, touchedView.isDescendant(of: gestureView), touchedView !== gestureView {
            return false
        }
        return true
    }

}
