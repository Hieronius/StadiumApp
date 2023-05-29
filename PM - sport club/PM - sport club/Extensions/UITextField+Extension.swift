//
//  UITextField + Extension.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 21.03.2023.
//

import UIKit

extension UITextField {
    
    /// Добвить картинку к левой стороне TextField
    func addLeft(image: UIImage) {
        layer.masksToBounds = true
        
        // change inset from "5" to "10" so it should suit the current project
        let inset: CGFloat = 10
        // change "x" position of the image from "0" to current position
        let containerView = UIView(frame: CGRect(x: 17,
                                                 y: 0,
                                                 width: frame.height + inset,
                                                 height: frame.height))
        
        let imageView = UIImageView(frame: CGRect(x: inset,
                                                  y: 0,
                                                  width: frame.height - inset * 2,
                                                  height: frame.height - inset * 2))
        
        imageView.image = image
        imageView.center = containerView.center
        containerView.addSubview(imageView)
        
        leftView = containerView
        leftViewMode = .always
    }
    
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
