//
//  PrimaryButton.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-02-15.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    var interactionActive: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        contentEdgeInsets = UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)
    }


    override func layoutSubviews(){
        super.layoutSubviews()
        let translucent = UIColor(red:1, green:1, blue:1, alpha: 0.1)
        layer.cornerRadius = frame.height / 2
        backgroundColor = interactionActive ? translucent : UIColor.clear
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        interactionActive = true
        layoutSubviews()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        interactionActive = false
        layoutSubviews()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        interactionActive = false
        layoutSubviews()
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
        interactionActive = true
        layoutSubviews()
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesEnded(presses, with: event)
        interactionActive = false
        layoutSubviews()
    }
    
}
