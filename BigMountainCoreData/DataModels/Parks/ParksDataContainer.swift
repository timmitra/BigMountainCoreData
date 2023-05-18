//
//  ParksDataContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-16.
//

import CoreData

class ParksDataContainer {
  
  let persistentContainer: NSPersistentContainer
  
  init() {
    persistentContainer = NSPersistentContainer(name: "ParksDataModel")
    persistentContainer.loadPersistentStores { _, _ in }
  }
}
