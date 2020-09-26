//
//  ServiceManager.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation

typealias APICompletionHandler = (Data?) -> Void

struct ServiceManager {
   
    /// Function to make API call and get data
    /// - Parameters:
    ///   - url: API URL
    ///   - completionHandler: Code block to be executed after API execution is completed
    /// - Returns: Void
    static func getAPI(url: String, completionHandler: @escaping APICompletionHandler) {

      guard let url = URL(string: url) else { return }
      let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)

      let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
        if error == nil, let data = data {
          completionHandler(data)
        } else {
          completionHandler(nil)
        }
      }

      dataTask.resume()
    }
}
