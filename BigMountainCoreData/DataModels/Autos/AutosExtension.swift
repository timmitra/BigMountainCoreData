//
//  AutosExtension.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-18.
//

import Foundation

extension AutoEntity {
  var viewModel: String {
    model ?? "N/A"
  }
  
  var viewYear: String {
    year ?? "N/A"
  }
}

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
