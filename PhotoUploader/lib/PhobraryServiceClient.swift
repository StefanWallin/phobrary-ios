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

    func createSession (onSuccess success: @escaping (Int) -> Void, onFailure failure: @escaping (Int) -> Void) {
        let body: String = "{\"token\": \"\(self.token)\" }"
        request(path: "/api/v1/sessions", body: body, method: .post, onSuccess: { statusCode, data, response, error in
            success(statusCode)
        }, onFailure: { statusCode, data, response, error in
            failure(statusCode)
        })
    }

    func request(
        path: String,
        body: String = "",
        method: Methods = .get,
        onSuccess success: @escaping (Int, Data?, URLResponse?, Error?) -> Void,
        onFailure failure: @escaping (Int, Data?, URLResponse?, Error?) -> Void
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
                let urlresponse = response as? HTTPURLResponse else
            {
                failure(408, data, response, error)
                print("No data or invalid statusCode")
                return
            }
            let statusCode = urlresponse.statusCode
            guard
                200 ... 299 ~= statusCode else
            {
                failure(statusCode, data, response, error)
                print("Invalid statusCode")
                return
            }
            success(urlresponse.statusCode, data, response, error)
        }
        taskWithRequest.resume()
    }
}
