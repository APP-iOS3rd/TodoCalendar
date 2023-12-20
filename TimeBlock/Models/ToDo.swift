//
//  ToDo.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/18/23.
//

import Foundation
import SwiftData

@Model
final class ToDo: Identifiable {
//    var id = UUID()
    @Attribute(.unique)
    var title: String
    var category: String
    var completed: Bool
    var day: Date
    var editMode: Bool
    
    @Attribute(.externalStorage)
    var tags: Tag?
    // 태그는 할일에 한개만 등록
    
    
    init(title: String = "", category: String = "", 
         completed: Bool = false, day: Date = .now, editMode: Bool = false) {
        self.title = title
        self.category = category
        self.completed = completed
        self.day = day
        self.editMode = editMode
    }
}

 
