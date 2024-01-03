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
    @Binding var isModalPresented: Bool
    @State var showingAlert = false
        
    var body: some View {
        Button {
            saveTodo()
        } label: {
            SaveBtnContent(systemName: "checkmark", btnText: "저장")
                .padding()
        }
        .buttonStyle(SaveBtnStyle())
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("카테고리 미선택"), message: Text("카테고리를 선택해 주세요!"), dismissButton: .default(Text("확인")))
                }
    }
}

extension AddTodoSaveBtn {
    func saveTodo() {
        if let category = addToDoVM.selectedCategory {
            self.isModalPresented.toggle()
            let task = Task(title: addToDoVM.title,date: addToDoVM.date, category: category, completed: false, time: Time())
            
            modelContext.insert(task)
        } else {
            showingAlert = true
            return
        }
    }
}
