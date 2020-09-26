//
//  FactsViewModel.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation

enum FactsError: Error {
  case noFactsAvailable
  case inValidData
}
typealias GetFactsDataCompletionHandler = (Result<FactsModel, FactsError>) -> Void

struct FactsViewModel {
    var factsArray: [Row]
    var title: String
    let factsAPI: String

    init(_ apiURL: String) {
      factsAPI = apiURL
      factsArray = []
      title = ""
    }

    mutating func updateFactsArray(_ array: [Row]) {
      factsArray = array
    }

    /// Function to get facts data
    /// - Parameter completion: Code block to be executed after API is executed
    /// - Returns: Void
    func getFactsFromAPI(completion: @escaping GetFactsDataCompletionHandler) {
        
        if NetworkManager().isNetworkConnectionAvailable(){
            ServiceManager.getAPI(url: factsAPI) { (data) in
                guard let data = data else{
                    completion(.failure(.inValidData))
                    return
                }
                if let response = DataManager().parseFacts(data: data, convertToModel: FactsModel.self){
                    completion(.success(response))
                } else {
                    completion(.failure(.inValidData))
                }

            }
            } else {
            print("No internet connectivity available.")
            
        }
    }
}
