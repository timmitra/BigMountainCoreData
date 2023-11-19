//
//  AutosDataContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-11-18.
//

import Foundation
import CoreData

class AutosDataContainer {
  
  let persistentContainer: NSPersistentContainer
  
  init(forPreview: Bool = false) {
    persistentContainer = NSPersistentContainer(name: "AutosDataModel")
    
    if forPreview {
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    persistentContainer.loadPersistentStores { _, _ in }
    
    addMockData(moc: persistentContainer.viewContext)
  }
}

extension AutosDataContainer {
  
  func addMockData(moc: NSManagedObjectContext) {
//    let audi = ManufacturerEntity(context: moc)
//    audi.name = "Audi"
//    audi.country = "Germany"
//    audi.autoEntities = [addAuto(moc: moc, model: "Q4 e-tron", year: "2024"),
//                         addAuto(moc: moc, model: "e-tron GT", year: "2024"),
//                         addAuto(moc: moc, model: "RS e-tron GT", year: "2024")
//    ]
  }
  
  func addAuto(moc: NSManagedObjectContext, model: String, year: String) {
//    let auto = AutoEntity(context: moc)
//    auto.model = model
  }
}
