//
//  TempSheetView.swift
//  SwifDataDemo
//
//  Created by 이민호 on 12/22/23.
//

import SwiftUI
import SwiftData

struct TempSheetView: View {
    @Query var todoData: [ToDoData]
    
    var body: some View {
        List {
            ForEach (todoData, id: \.self) { todo in
                Section {
                    ForEach (todo.task, id: \.self) { task in
                        VStack {
                            Text(task.title)
                            Text(task.category?.name ?? "없음")
                        }
                    }
                } header: {
                    Text(todo.date)
                }
            }
        }
    }
}

#Preview {
    TempSheetView()
}
