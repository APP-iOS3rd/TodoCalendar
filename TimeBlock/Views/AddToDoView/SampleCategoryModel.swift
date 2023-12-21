//
//  SampleCategoryModel.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

class SampleCategoryModel {
    var name: String
    var color: Color
    
    init(name: String = "일정", color: Color = .accentColor) {
        self.name = name
        self.color = color
    }
}

extension SampleCategoryModel: Hashable {
    static func == (lhs: SampleCategoryModel, rhs: SampleCategoryModel) -> Bool {
        return lhs.name == rhs.name && lhs.color == rhs.color
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(color)
    }
}
