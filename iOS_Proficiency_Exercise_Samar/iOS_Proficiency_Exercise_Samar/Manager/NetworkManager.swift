//
//  NetworkManager.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation
struct NetworkManager {
    /// Function to check for internet connectivity before performing network operations.
    /// - Returns: This function returns Bool value as per internet connection status.
    func isNetworkConnectionAvailable() -> Bool {
      guard let reachability = try? Reachability() else { return false }
      let connection = reachability.connection

      switch connection {
      case .wifi:
        print("Reachable via WiFi")
        return true
      case .cellular:
        print("Reachable via Cellular")
        return true
      case .none:
        return false
      case .unavailable:
        return false
      }
    }
}
