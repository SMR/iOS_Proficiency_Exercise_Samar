//
//  ReuseIdentifierProtocol.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation

/// Protocol to get reuse identifier name
protocol ReuseIdentifierProtocol {

  static var reuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol {

  /// Default implementation of ReuseIdentifierProtocol
  static var reuseIdentifier: String {
    return String(describing: Self.self)
  }
}
