//
//  TaskCellView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI

struct TaskCellView: View {
    @Binding var todo: ToDoData?
    @State var isShownSheet = false
    var task: Task
    var date: Date
            
    var body: some View {
        Button {
            self.isShownSheet.toggle()
        } label: {
            HStack {
                Text(task.title)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .sheet(isPresented: $isShownSheet) {
            TodoDetailView(todo: self.$todo, isShownSheet: $isShownSheet, task: self.task, date: self.date)
                .presentationDetents([.fraction(0.5)])
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 50)
        .background(Color(hex: task.category?.color ?? "a2a2d0"))
        .cornerRadius(20)
        
    }
}

//#Preview {
//    TaskCellView()
//}
