//
//  TaskViewModel.swift
//  TaskListApp
//
//  Created by Dayane Alves on 15/02/26.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    
    private let storageKey = "tasks_list"
    
    init() {
        loadTasks()
    }
    
    // MARK: - FUNÇÃO DE ADICIONAR TAREFA
    
    func addTask(title: String) {
        guard !title.isEmpty else { return }
        let newTask = Task(title: title)
        tasks.append(newTask)
    }
    
    // MARK: - FUNÇÃO DE REMOVER TAREFA
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    // MARK: - FUNÇÃO DE VERIFICAÇÃO: SE A TAREFA ESTÁ COMPLETA OU NÃO
    
    func toggleTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    // MARK: - PERSISTIENCIA SIMPLES
    
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = decoded
        }
    }
}
