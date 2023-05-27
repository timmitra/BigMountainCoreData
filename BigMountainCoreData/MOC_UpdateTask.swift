//
//  MOC_UpdateTask.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-27.
//

import SwiftUI

struct MOC_UpdateTask: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest<TaskEntity>(sortDescriptors: [SortDescriptor(\.done), SortDescriptor(\.priority)])
    private var tasks
    @State private var newTask = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { todo in
                    NavigationLink {
                        EditTaskView(todo: todo)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(todo.viewTaskName)
                                    .strikethrough(todo.done, color: .red)
                                Text(todo.viewDueDate)
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: todo.viewPriority)
                                .foregroundColor(todo.viewPriorityColor)
                        }
                        .font(.title2)
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

struct MOC_UpdateTask_Previews: PreviewProvider {
    static var previews: some View {
        MOC_UpdateTask()
            .environment(\.managedObjectContext, TasksDataContainer(forPreview: true).persistentContainer.viewContext)
    }
}
