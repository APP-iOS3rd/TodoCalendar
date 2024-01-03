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
    @Attribute(.unique) var date: String
    var task: [Task] = []
    
    init(date: String) {
        self.date = date
    }
    
    func addTask(_ task: Task) {
        self.task.append(task)
    }
    
    func deleteTask(_ task: Task) {
        self.task = self.task.filter({$0 != task})
    }
    
}
