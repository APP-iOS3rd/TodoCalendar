//
//  Time.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/26.
//

import Foundation
import SwiftData

@Model
class Time: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case id, start, end
    }
    
    @Attribute(.unique) var id = UUID()
    var start: String?
    var end: String?
    
    init(id: UUID = UUID(), start: String? = nil, end: String? = nil) {
        self.id = id
        self.start = start
        self.end = end
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.start = try container.decode(String.self, forKey: .id)
        self.end = try container.decode(String.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(start, forKey: .start)
        try container.encode(end, forKey: .end)
    }
}
