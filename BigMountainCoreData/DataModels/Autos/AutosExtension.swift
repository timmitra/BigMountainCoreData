//
//  AutosExtension.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-18.
//

import Foundation

extension ManufacturerEntity {
  var viewName: String {
    name ?? "N/A"
  }
  
  var viewCountry: String {
    country ?? "[Not Specified]"
  }
  
  // MARK: - Relationships
  var viewAutoEntities: [AutoEntity] {
    // Convert NSSet to array
    return autoEntities?.allObjects as? [AutoEntity] ?? []
  }
  
}
