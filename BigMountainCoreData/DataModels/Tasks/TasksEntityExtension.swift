//
//  TasksEntityExtension.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-26.
//

import CoreData
import SwiftUI

// Handle nils and formatting
extension TaskEntity {
    var viewTaskName: String {
        taskName ?? "[Enter Task Name]"
    }
    
    var viewDueDate: String {
        dueDate?.formatted(date: .numeric, time: .omitted) ?? ""
    }
    
    var viewPriority: String {
        "\(priority).circle.fill"
    }
    
    var viewPriorityColor: Color {
        if done {
            return .gray
        } else if priority == 1 {
            return .green
        } else if priority == 2 {
            return .yellow
        }
        
        return .red
    }
}
