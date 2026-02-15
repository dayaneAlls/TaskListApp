//
//  ListTask.swift
//  TaskListApp
//
//  Created by Dayane Alves on 15/02/26.
//

import SwiftUI

struct ListTask: View {
    // MARK: - PROPERTIES
    
    @ObservedObject var vm: TaskViewModel
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - LISTA DE TAREFAS
        
        List {
            ForEach(vm.tasks) { task in
                HStack {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                        .onTapGesture {
                            vm.toggleTask(task: task)
                        }
                    
                    Text(task.title)
                        .strikethrough(task.isCompleted)
                        .foregroundColor(task.isCompleted ? .gray : .primary)
                }
            }
            .onDelete(perform: vm.deleteTask)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    ListTask(vm: TaskViewModel())
}
