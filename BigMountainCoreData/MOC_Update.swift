//
//  MOC_Update.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-26.
//

import SwiftUI
import CoreData

struct MOC_Update: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest<TaskEntity>(sortDescriptors: [SortDescriptor(\.done)])
    private var tasks
    
    var body: some View {
        List {
            ForEach(tasks) { todo in
                Text(todo.viewTaskName)
                    .strikethrough(todo.done, color: .red)
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            todo.done.toggle()
                            try? moc.save()
                        } label: {
                            Image(systemName: todo.done ? "arrow.uturn.backward.square" : "checkmark.square")
                        }
                    }
                    .tint(todo.done ? .blue : .green)
            }
            //.onDelete(perform: deleteTask)
        }
    }
    
    private func deleteTask(offsets: IndexSet) {
        for offset in offsets {
            moc.delete(tasks[offset])
        }
        try? moc.save()
    }
}

struct MOC_Update_Previews: PreviewProvider {
    static var previews: some View {
        MOC_Update()
            .environment(\.managedObjectContext, TasksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}

