//
//  Task.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/21.
//

import Foundation
import SwiftData

@Model
final class Task: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case id, title, date, category, completed, time
    }
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var date: String?
    @Relationship var category: Category?
    var completed: Bool
    @Relationship var time: Time?
    
    init(title: String, date: String, category: Category, completed: Bool, time: Time) {
        self.title = title
        self.completed = completed
        self.setCategory(category)
        self.setTime(time)
        self.setDate(date)
    }
    
    func setCategory(_ categoty: Category) {
        self.category = categoty
    }
    
    func setDate(_ date: String) {
        self.date = date
    }
    
    func setTime(_ time: Time){
        self.time = time
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.date = try container.decode(String.self, forKey: .date)
        self.category = try container.decode(Category.self, forKey: .category)
        self.completed = try container.decode(Bool.self, forKey: .completed)
        self.time = try container.decode(Time.self, forKey: .time)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(date, forKey: .date)
        try container.encode(category, forKey: .category)
        try container.encode(completed, forKey: .completed)
        try container.encode(time, forKey: .time)
    }
}
