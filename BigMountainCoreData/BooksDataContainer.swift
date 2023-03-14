//
//  BooksDataContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-03-14.
//

import CoreData

class BooksDataContainer {
  
  let persistentContainer: NSPersistentContainer
  
  init() {
    persistentContainer = NSPersistentContainer(name: "BooksEntity")
    persistentContainer.loadPersistentStores { _, _ in }
  }
}
