//
//  AvatarView.swift
//  VKClient
//
//  Created by danuhaha on 26.10.2021.
//

import UIKit

@IBDesignable class AvatarView: UIView {

    private var view: UIView?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowRadius: Float = 1
    @IBInspectable var shadowOpacity: Float = 1
    
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
        let nib = UINib(nibName: "AvatarView", bundle: bundle)
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
    
}
