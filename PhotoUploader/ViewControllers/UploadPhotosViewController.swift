//
//  UploadPhotosViewController.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-01-30.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//

import UIKit

class UploadPhotosViewController: UIViewController {

    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiModifications()
    }
    
    func uiModifications() {
        UIModifications.setupGradient(view: self.view)
        UIModifications.setupProgressView(progressView: self.progressView)
    }
    @IBAction func logout(_ sender: Any) {
        RouteSwitcher.logout()
    }
    
    @IBAction func upload(_ sender: Any) {
        
    }
    
}
