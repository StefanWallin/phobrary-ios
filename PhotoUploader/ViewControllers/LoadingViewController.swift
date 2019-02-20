//
//  LoadingViewController.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-02-20.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//
import UIKit

class LoadingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        uiModifications()
    }
    
    func uiModifications() {
        UIModifications.setupGradient(view: self.view)
    }    
}

