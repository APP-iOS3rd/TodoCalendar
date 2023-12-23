//
//  TodoData.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/21.
//

import Foundation
import SwiftData

@Model
final class ToDoData: Identifiable {
    @Attribute(.unique) var id = UUID()
    var date: Date
    var task: [Task]
    
    init(id: UUID = UUID(), date: Date, task: [Task]) {
        self.id = id
        self.date = date
        self.task = task
    }
}
