//
//  TodoDetailView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI
import SwiftData

struct TodoDetailView: View {
    @Binding var isShownSheet: Bool
    var task: Task
    var date: Date
        
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 22) {
                HStack {
                    TodoCategoryView(category: task.category)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    TodoDeleteBtn(isShownSheet: self.$isShownSheet, task: self.task, date: self.date)
                }
                                                        
                Text(task.title)
                    .font(.system(size: 29, weight: .bold))
                                                        
                Text(date.dateToString)
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}
