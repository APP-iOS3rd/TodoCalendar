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
    
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

 
