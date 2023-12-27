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
    @Query var toDoData: [ToDoData]
                                
    var body: some View {
        NavigationStack {
            List{
                ForEach(toDoData, id: \.self) { todo in
                    if todo.date == date.dateToString {
                        ForEach(todo.task, id: \.self) { task in
                            TaskCellView(task: task, date: self.date)
                                .listRowInsets(EdgeInsets())
                                .listRowSeparator(.hidden)
                                .padding(.bottom, 20)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .padding(.top, 40)
    }
}
