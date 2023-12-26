//
//  Time.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/26.
//

import Foundation
import SwiftData

@Model
class Time: Identifiable {
    @Attribute(.unique) var id = UUID()
    var start: String?
    var end: String?
    
    init(id: UUID = UUID(), start: String? = nil, end: String? = nil) {
        self.id = id
        self.start = start
        self.end = end
    }
}
