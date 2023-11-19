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
    
  //  addAutosMockData(moc: persistentContainer.viewContext)
  }
}
