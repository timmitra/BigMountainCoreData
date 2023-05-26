//
//  MOC_Delete.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-26.
//

import SwiftUI
import CoreData

struct MOC_Delete: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest<TaskEntity>(sortDescriptors: [SortDescriptor(\.done)])
    private var tasks
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                Text(task.viewTaskName)
                    .strikethrough(task.done, color: .red)
            }
            .onDelete(perform: deleteTask)
        }
    }
    
    private func deleteTask(offsets: IndexSet) {
        for offset in offsets {
            moc.delete(tasks[offset])
        }
        try? moc.save()
    }
}

struct MOC_Delete_Previews: PreviewProvider {
    static var previews: some View {
        MOC_Delete()
            .environment(\.managedObjectContext, TasksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}

