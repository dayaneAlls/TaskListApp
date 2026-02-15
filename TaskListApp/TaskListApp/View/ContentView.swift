//
//  ContentView.swift
//  TaskListApp
//
//  Created by Dayane Alves on 15/02/26.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @StateObject private var viewModel = TaskViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                AddTaskView(vm: viewModel)
                
                ListTask(vm: viewModel)
            }
            .navigationTitle("Minhas Tarefas")
        }
    }
}

#Preview {
    ContentView()
}
