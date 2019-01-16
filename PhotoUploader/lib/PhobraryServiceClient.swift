//
//  PhobraryServiceClient.swift
//  PhotoUploader
//
//  Created by Stefan Wallin on 2018-12-31.
//  Copyright © 2018 Stefan Wallin. All rights reserved.
//

import UIKit

class PhobraryServiceClient: NSObject {
    let baseURL: URL!
    let token: String
    
    enum Methods: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    init(baseURL: URL, token: String) {
        self.baseURL = baseURL
        self.token = token
    }

    func createSession (onSuccess success: @escaping () -> Void, onFailure failure: @escaping () -> Void) {
        let body: String = "{\"token\": \"\(self.token)\" }"
        request(path: "/api/v1/sessions", body: body, method: .post, onSuccess: { data, response, error in
            success()
        }, onFailure: { data, response, error in
            failure()
        })
    }
    
    func request(
        path: String,
        body: String = "",
        method: Methods = .get,
        onSuccess success: @escaping (Data?, URLResponse?, Error?) -> Void,
        onFailure failure: @escaping (Data?, URLResponse?, Error?) -> Void
        ) {
        let session = URLSession(configuration: .ephemeral)
        let url: URL = URL(string: path, relativeTo: baseURL)!
        var request = URLRequest(url: url)
        request.allowsCellularAccess = false
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = body.data(using: .utf8);
        
        let taskWithRequest = session.dataTask(with: request) { data, response, error in
            guard
                data != nil,
                let urlresponse = response as? HTTPURLResponse,
                200 ... 299 ~= urlresponse.statusCode else {
                print("No data or invalid statusCode")
                failure(data, response, error)
                return
            }
            success(data, response, error)
            return
        }
        taskWithRequest.resume()
    }
}
