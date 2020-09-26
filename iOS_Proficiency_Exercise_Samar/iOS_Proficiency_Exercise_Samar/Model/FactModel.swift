//
//  FactModel.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation

struct FactsModel: Codable {
  var title: String?
  var rows: [Row]?
}

struct Row: Codable {
  var title, rowDescription: String?
  var imageHref: String?

  enum CodingKeys: String, CodingKey {
    case title
    case rowDescription = "description"
    case imageHref
  }
}
