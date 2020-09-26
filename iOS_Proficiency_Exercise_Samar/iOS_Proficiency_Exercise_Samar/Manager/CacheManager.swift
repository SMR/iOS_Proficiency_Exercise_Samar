//
//  CacheManager.swift
//  iOS_Proficiency_Exercise_Samar
//
//  Created by iSparshiT on 26/09/20.
//  Copyright © 2020 Samarjeet. All rights reserved.
//

import Foundation
/// Class for caching data in memory
class CacheManager {

  /// Creating singleton instance of this class
  static let shared = CacheManager()

  let cache = NSCache<NSString, AnyObject>()

  /// Function to add object in cache
  /// - Parameters:
  ///   - object: Object to be added in cache
  ///   - key: Key representing that object in cache
  /// - Returns: Void
  func addToCache(objectToCache object: AnyObject, withKey key: String) {
    cache.setObject(object, forKey: key as NSString)
  }

  /// Function to get object from cache
  /// - Parameter key: Key representing that object in cache
  /// - Returns: Object saved in cache (Optional)
  func objectFromCache(withKey key: String) -> AnyObject? {
      return cache.object(forKey: key as NSString)
  }
}

