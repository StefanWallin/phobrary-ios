//
//  PhobraryService.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2018-12-31.
//  Copyright © 2018 Stefan Wallin. All rights reserved.
//

import UIKit

class PhobraryService: NSObject {
    let phobraryClient: PhobraryServiceClient
    init(serverAdress: String, serverToken: String) {
        phobraryClient = PhobraryServiceClient(baseURL: URL(string: serverAdress)!, token: serverToken)
    }
    
    func login(onSuccess success: @escaping () -> Void, onFailure failure: @escaping () -> Void) {
        phobraryClient.createSession(onSuccess: success, onFailure: failure)
    }
}

