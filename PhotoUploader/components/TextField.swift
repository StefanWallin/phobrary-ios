//
//  PrimaryButton.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-02-15.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//

import UIKit

class FullTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    
    override func becomeFirstResponder() -> Bool {
        let translucent = UIColor(red:1, green:1, blue:1, alpha: 0.1)
        backgroundColor = translucent
        super.becomeFirstResponder()
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        backgroundColor = .clear
        super.resignFirstResponder()
        return true
    }

    override func layoutSubviews(){
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
