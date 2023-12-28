//
//  TodoDeleteBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI
import SwiftData

struct TodoDeleteBtn: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isShownSheet: Bool
    var task: Task
    var date: Date
        
    var body: some View {
        Button {
            isShownSheet = false
            modelContext.delete(self.task)
        } label: {
            Image(systemName: "trash")
        }
    }
}
