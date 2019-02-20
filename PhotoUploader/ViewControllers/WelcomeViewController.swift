//
//  StartViewController.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-01-30.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var getStartedButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiModifications()
    }
    
    func uiModifications() {
        UIModifications.setupGradient(view: self.view)
    }
    
    
}
