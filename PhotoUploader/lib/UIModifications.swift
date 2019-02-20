//
//  uiModifications.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-02-08.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//

import UIKit
class UIModifications {
    class func setupGradient(view: UIView) {
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor(red:0.95, green:0.41, blue:0.38, alpha:1.0).cgColor, UIColor(red:0.97, green:0.57, blue:0.88, alpha:1.0).cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    class func setupProgressView(progressView: UIProgressView) {
        progressView.progress = 0.10
        progressView.layer.cornerRadius = 15
        progressView.layer.masksToBounds = true
        progressView.trackTintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1)
        progressView.progressTintColor = UIColor.white
        progressView.progressViewStyle = .bar
        progressView.layer.borderWidth = 2
        progressView.layer.borderColor = UIColor.white.cgColor

    }
}
