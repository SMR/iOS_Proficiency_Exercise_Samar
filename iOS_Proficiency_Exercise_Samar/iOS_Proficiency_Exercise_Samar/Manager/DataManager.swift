//
//  DataManager.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation

class DataManager{
    
    func parseFacts<T: Decodable>(data: Data, convertToModel: T.Type) -> T? {

       // Fix: Used this fix as data is not decoding from JSONDecoder normally.
       let str = String(decoding: data, as: UTF8.self)
       guard let json = str.convertToDictionary() else {
         return nil
       }
       guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .sortedKeys) else {
         return nil
       }

       guard let factsObject = try? JSONDecoder().decode(T.self, from: jsonData) else {
         return nil
       }

       return factsObject
     }
    
}
