//
//  ViewController.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2018-12-27.
//  Copyright © 2018 Stefan Wallin. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController {
    @IBOutlet var serverAdressTextField: UITextField!
    @IBOutlet var serverTokenTextField: UITextField!
    @IBOutlet var connectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnConnectAndSave(_ sender: Any) {
        let serverAdress:String = serverAdressTextField.text ?? ""
        let serverToken:String = serverTokenTextField.text ?? ""
        attemptConnection(adress: serverAdress, token: serverToken)
    }
    
    func attemptConnection(adress: String, token: String) {
        DispatchQueue.main.async { self.connectionLabel.text = "Connecting..." }
        connectionLabel.isHidden = !connectionLabel.isHidden
        let service = PhobraryService(serverAdress: adress, serverToken: token)
        service.login(onSuccess: {
            DispatchQueue.main.async { self.connectionLabel.text = "Success" }
        }, onFailure: {
            DispatchQueue.main.async { self.connectionLabel.text = "Failure" }
        })
    }
}

