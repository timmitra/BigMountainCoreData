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
        
        if forPreview {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        persistentContainer.loadPersistentStores { _, _ in }
        
        addTasksMockData(moc: persistentContainer.viewContext)
    }
}

extension TasksDataContainer {
    func addTasksMockData(moc: NSManagedObjectContext) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        addTask(moc: moc, taskName: "Get anniversary gift", done: false, dueDate: dateFormatter.date(from: "7-06-2022")!, priority: 3)
        addTask(moc: moc, taskName: "Prepare for sale", done: false, dueDate: dateFormatter.date(from: "8-27-2022")!, priority: 2)
        addTask(moc: moc, taskName: "Marketing Meeting", done: false, dueDate: dateFormatter.date(from: "5-25-2022")!, priority: 1)
        addTask(moc: moc, taskName: "Get milk", done: false, dueDate: dateFormatter.date(from: "4-17-2022")!, priority: 1)

        try? moc.save()
        
    }
    
    func addTask(moc: NSManagedObjectContext, taskName: String, done: Bool, dueDate: Date?, priority: Int16) {
        let task = TaskEntity(context: moc)
        task.taskName = taskName
        task.done = done
        task.dueDate = dueDate
        task.priority = priority
    }
}
