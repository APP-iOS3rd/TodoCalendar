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
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    @Relationship var category: Category?
    var completed: Bool
    @Relationship var time: Time?
    
    init(title: String, category: Category, completed: Bool, time: Time) {
        self.title = title
        self.completed = completed
        self.setCategory(category)
        self.setTime(time)
    }
    
    func setCategory(_ categoty: Category) {
        self.category = categoty
    }
    
    
    func setTime(_ time: Time){
        self.time = time
    }

}
