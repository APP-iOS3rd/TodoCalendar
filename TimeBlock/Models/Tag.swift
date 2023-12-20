//
//  Tag.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/19/23.
//

import Foundation
import SwiftData

@Model
final class Tag {
    var name: String
    var todos: [ToDo]?
    var color: RGBColor
    var editMode: Bool
    
    init(name: String = "dummy", color: RGBColor = RGBColor(red: 1, green: 0, blue: 0), editMode:Bool = false) {
        self.name = name
        self.color = color
        self.editMode = editMode
    }
}
