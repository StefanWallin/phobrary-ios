//
//  ViewController.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2018-12-27.
//  Copyright © 2018 Stefan Wallin. All rights reserved.
//

import UIKit
import os.log
import SwiftKeychainWrapper

class ConnectionViewController: UIViewController {
    @IBOutlet var serverAdressTextField: UITextField!
    @IBOutlet var serverTokenTextField: UITextField!
    @IBOutlet var connectionLabel: UILabel!
    @IBAction func logout(_ sender: Any) {
        RouteSwitcher.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiModifications()
    }
    
    func uiModifications() {
        UIModifications.setupGradient(view: self.view)
    }
    
    @IBAction func btnConnectAndSave(_ sender: UIButton) {
        let serverAdress:String = serverAdressTextField.text ?? ""
        let serverToken:String = serverTokenTextField.text ?? ""
        attemptConnection(adress: serverAdress, token: serverToken)
    }
    
    func attemptConnection(adress: String, token: String) {
        DispatchQueue.main.async { self.connectionLabel.text = "Connecting..." }
        connectionLabel.isHidden = !connectionLabel.isHidden
        let service = PhobraryService(serverAdress: adress, serverToken: token)
        service.login(onSuccess: {(statusCode: Int) in
            DispatchQueue.main.async {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let uploadPhotosViewController = storyBoard.instantiateViewController(withIdentifier: "uploadPhotosViewController") as! UploadPhotosViewController
                self.present(uploadPhotosViewController, animated: true, completion: nil)
            }
            KeychainWrapper.standard.set(adress, forKey: "serverAdress")
            KeychainWrapper.standard.set(token, forKey: "serverToken")
            
        }, onFailure: {(statusCode: Int) in
            let label:String
            if statusCode == 408 {
                label = "Server seems to be offline"
            } else if statusCode == 401 || statusCode == 403 {
                label = "Access denied"
            } else {
                label = "Failure \(statusCode)"
            }
            DispatchQueue.main.async { self.connectionLabel.text = label }
        })
    }
}

