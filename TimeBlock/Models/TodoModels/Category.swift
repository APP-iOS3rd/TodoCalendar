//
//  Category.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/21.
//

import Foundation
import SwiftData

@Model
final class Category: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var color: String
    
    init(id: UUID = UUID(), name: String = "카테고리 선택", color: String = "a2a2d0") {
        self.id = id
        self.name = name
        self.color = color
    }
}
