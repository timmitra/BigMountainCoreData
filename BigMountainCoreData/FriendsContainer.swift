//
//  FriendsContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-03-11.
//

import Foundation
import CoreData

class FriendsContainer {
  
  let persistentContainer: NSPersistentContainer
  
  init() {
    persistentContainer = NSPersistentContainer(name: "FriendsDataModel")
    // print the location of the sqlite file
    print(persistentContainer.persistentStoreDescriptions.first!.url!.absoluteString)
    persistentContainer.loadPersistentStores { _, _ in }
  }
}
