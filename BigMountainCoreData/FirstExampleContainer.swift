//
//  FirstExampleContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import CoreData

class FirstExampleContainer {
  
  let persistentContainer: NSPersistentContainer
  
  init() {
    persistentContainer = NSPersistentContainer(name: "FirstExample")
    persistentContainer.loadPersistentStores { _, _ in }
  }
}
