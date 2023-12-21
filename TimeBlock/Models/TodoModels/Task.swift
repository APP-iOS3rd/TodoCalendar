//
//  Task.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/21.
//

import Foundation
import SwiftData

@Model
final class Task: Identifiable {
    var content: String
    var category: String
    var completed: Bool
    
    init(content: String, category: String, completed: Bool) {
        self.content = content
        self.category = category
        self.completed = completed
    }
}
