//
//  RouteSwitcher.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2019-02-16.
//  Copyright © 2019 Stefan Wallin. All rights reserved.
//
import Foundation
import UIKit
import SwiftKeychainWrapper

class RouteSwitcher {
    
    static func updateRootVC(){
        let token: String? = KeychainWrapper.standard.string(forKey: "serverToken")
        let adress: String? = KeychainWrapper.standard.string(forKey: "serverAdress")
        if (token == nil || adress == nil) {
            DispatchQueue.main.async {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = storyBoard.instantiateViewController(withIdentifier: "welcomeViewController") as! WelcomeViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = rootVC
            }
            return
        }
        let service = PhobraryService(serverAdress: adress!, serverToken: token!)
        service.login(onSuccess: {(statusCode: Int) in
            DispatchQueue.main.async {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = storyBoard.instantiateViewController(withIdentifier: "uploadPhotosViewController") as! UploadPhotosViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = rootVC
            }
        }, onFailure: {(statusCode: Int) in
            DispatchQueue.main.async {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = storyBoard.instantiateViewController(withIdentifier: "connecionViewController") as! ConnectionViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = rootVC
            }
        })
    }
    
    static func logout() {
        KeychainWrapper.standard.removeObject(forKey: "serverToken")
        DispatchQueue.main.async {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let rootVC = storyBoard.instantiateViewController(withIdentifier: "welcomeViewController") as! WelcomeViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
        }
    }
    
}
