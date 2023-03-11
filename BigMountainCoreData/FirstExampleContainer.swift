//
//  FirstExampleContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-02-15.
//

import CoreData

class FriendsContainer {
  
  let persistentContainer: NSPersistentContainer
  
  init() {
    persistentContainer = NSPersistentContainer(name: "FriendsDataModel")
    persistentContainer.loadPersistentStores { _, _ in }
  }
}
