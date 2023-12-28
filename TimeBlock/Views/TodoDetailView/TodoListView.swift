//
//  TodoListView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Binding var date: Date
    @Query var tasks: [Task]
                                
    var body: some View {
        NavigationStack {
            List{
                ForEach(tasks, id: \.self) { task in
                    if let taskDate = task.date, taskDate == self.date.dateToString {
                        TaskCellView(task: task, date: self.date)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .padding(.bottom, 20)
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .padding(.top, 40)
    }
}
