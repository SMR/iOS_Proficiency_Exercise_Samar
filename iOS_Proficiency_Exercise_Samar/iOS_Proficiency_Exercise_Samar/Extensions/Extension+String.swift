//
//  Extension+String.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation

extension String {

  /// Convert JSON string to Dictionary
  /// - Returns: Dictionary (Optional)
  func convertToDictionary() -> [String: Any]? {
    if let data = self.data(using: .utf8) {
      if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
        return jsonObject
      }

      return nil
    }

    return nil
  }
}
