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
    @State var task: [Task] = []
    @State var todo: ToDoData?
                                
    var body: some View {
        NavigationStack {
            List{
                ForEach(task, id: \.self) { task in
                    TaskCellView(todo: $todo, task: task, date: date)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .padding(.bottom, 20)
                }
            }
            .onChange(of: date) {
                self.todo = toDoData.filter({$0.date == date.dateToString}).first
                self.task = self.todo?.task ?? []
            }
            .onChange(of: todo?.task) {
                self.task = todo?.task ?? []
            }
            .onChange(of: toDoData) {
                self.todo = toDoData.filter({$0.date == date.dateToString}).first
                self.task = self.todo?.task ?? []
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

//#Preview {
//    TodoListView()
//}
