//
//  AddTaskView.swift
//  TaskListApp
//
//  Created by Dayane Alves on 15/02/26.
//

import SwiftUI

struct AddTaskView: View {
    // MARK: - PROPERTIES
    
    @State private var newTaskTitle = ""
    
    let vm: TaskViewModel
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - ADICIONAR TAREFA
        
        HStack {
            TextField("Digite uma tarefa...", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                vm.addTask(title: newTaskTitle)
                newTaskTitle = ""
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    AddTaskView(vm: TaskViewModel())
}
