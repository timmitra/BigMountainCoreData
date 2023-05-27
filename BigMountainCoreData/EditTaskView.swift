//
//  EditTaskView.swift
//  BigMountainCoreData
//
//  Created by Tim Mitra on 2023-05-27.
//

import SwiftUI

struct EditTaskView: View {
    let todo: TaskEntity!
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var taskName: String = ""
    @State private var priority = 0
    @State private var dueDate = Date()
    
    var body: some View {
        VStack(spacing: 16.0) {
            TextField("task", text: $taskName)
                .textFieldStyle(.roundedBorder)
            VStack(alignment: .leading) {
                Text("Priority")
                Picker(selection: $priority) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                } label: {
                    Text("Priority")
                }
                .pickerStyle(.segmented)
            }
            DatePicker("Due Date", selection: $dueDate)
            Button("Save") {
                todo.taskName = taskName
                todo.priority = Int16(priority)
                todo.dueDate = dueDate
                
                 try? moc.save()
                
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding()
        .onAppear {
            taskName = todo.viewTaskName
            priority = Int(todo.priority)
            dueDate = todo.dueDate ?? Date()
        }
        .navigationTitle("Edit Task")
    }
}

//struct EditTaskView_Previews: PreviewProvider {
//    let todo: TaskEntity?
//    static var previews: some View {
//        EditTaskView(todo: todo)
//    }
//}
