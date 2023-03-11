//
//  FriendsContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-03-11.
//

import Foundation
import CoreData

class FriendsContainer {
  
  static var preview: NSManagedObjectContext {
    get {
      let persistentContainer = NSPersistentContainer(name: "FriendsDataModel")
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
      persistentContainer.loadPersistentStores { _, _ in }
      //addMockData(moc: persistentContainer.viewContext)
      return persistentContainer.viewContext
    }
  }
  
  let persistentContainer: NSPersistentContainer
  
  init(forPreview: Bool = false) {
    persistentContainer = NSPersistentContainer(name: "FriendsDataModel")
    // print the location of the sqlite file
    // print(persistentContainer.persistentStoreDescriptions.first!.url!.absoluteString)
    if forPreview {
      persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    persistentContainer.loadPersistentStores { _, _ in }
    
    if forPreview {
      addMockData(moc: persistentContainer.viewContext)
      //FriendsContainer.addMockData(moc: persistentContainer.viewContext)
    }
  }
  
}

extension FriendsContainer {
  func addMockData(moc: NSManagedObjectContext) {
    let friend1 = FriendsEntity(context: moc)
    friend1.firstName = "Chris"
    friend1.lastName = "Bloom"
    
    let friend2 = FriendsEntity(context: moc)
    friend2.firstName = "Jacqueline"
    friend2.lastName = "Cruz"
    
    let friend3 = FriendsEntity(context: moc)
    friend3.firstName = "Rodrigo"
    friend3.lastName = "Jones"
    
    try? moc.save()
  }
}
