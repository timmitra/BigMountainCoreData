//
//  TasksDataContainer.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-26.
//

import UIKit
import CoreData

class TasksDataContainer {
    
    let persistentContainer: NSPersistentContainer
    
    init(forPreview: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "TasksDataModel")
    }
}
