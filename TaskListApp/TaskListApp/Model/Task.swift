//
//  Task.swift
//  TaskListApp
//
//  Created by Dayane Alves on 15/02/26.
//

import SwiftUI

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
