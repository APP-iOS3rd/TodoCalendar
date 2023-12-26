//
//  AddTodoSaveBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/22/23.
//

import SwiftUI
import SwiftData

struct AddTodoSaveBtn: View {
    @Environment(\.modelContext) var modelContext
    @Query var todoData: [ToDoData]
    @StateObject var addToDoVM: AddToDoVM
    @State var isShownSheet = false
        
    var body: some View {
        Button {
            saveTodo()
            self.isShownSheet.toggle()
        } label: {
            HStack {
                Image(systemName: "checkmark")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                
                Text("저장")
                    .foregroundStyle(.white)
                    .font(Font.system(size: 20, weight: .bold))
            }
            .minimumScaleFactor(0.5)
            .padding()
        }
        .frame(height: 50)
        .background(.black)
        .cornerRadius(33)
        .sheet(isPresented: $isShownSheet) {
            TempSheetView()
        }
        
    }
}

extension AddTodoSaveBtn {
    func saveTodo() {
        guard let category = addToDoVM.selectedCategory else { return }
        let task = Task(title: addToDoVM.title, category: category, completed: false)
        
        if let filtered = todoData.filter({ $0.date == addToDoVM.date}).first {
            filtered.addTask(task)
        } else {
            let todoData = ToDoData(date: addToDoVM.date)
            todoData.addTask(task)
            modelContext.insert(todoData)
        }
    }
}
