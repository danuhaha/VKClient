//
//  LikeView.swift
//  VKClient
//
//  Created by danuhaha on 26.10.2021.
//

import UIKit

@IBDesignable class LikeView: UIView {

    private var view: UIView?
    
    @IBOutlet weak var likeCounter: UILabel!
    
    var liked = false
    var likeCount = 0
    var likeImage = UIImage(systemName: "heart")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LikeView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {return UIView()}
        return view
        
    }
   
    private func setup() {
        view = loadFromNib()
        guard let view = view else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    @IBAction func pressLikeButton(_ sender: Any) {
        guard let button = sender as? UIButton else {return}
        if liked {
            likeImage = UIImage(systemName: "heart")
            button.setImage(likeImage, for: .normal)
            likeCount -= 1
            liked = false
        } else {
            likeImage = UIImage(systemName: "heart.fill")
            button.setImage(likeImage, for: .normal)
            likeCount += 1
            liked = true
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
                button.transform = CGAffineTransform(rotationAngle: .pi / 4)
            }) { _ in
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
                        button.transform = CGAffineTransform.identity
                    })
            }
        }
        likeCounter.text = "\(likeCount)"
    }
}
