//
//  AddTodoView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    
    @StateObject var addToDoVM = AddToDoVM()
    @Binding var isModalPresented: Bool
    @Binding var isDataOn: Bool
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var calendarModule: CalendarModule.Coordinator
    @State private var selectedDateString = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                SelectCategoryBtn(selectedCategory: $addToDoVM.selectedCategory)
                Spacer()
            }
            .padding(.bottom, 20)
            
            AddToDoTextField(content: $addToDoVM.title)
            
            HStack{
                Text(selectedDateString)
                    .font(.bold18)
                Spacer()
            }
            
            Spacer()
            Spacer()
            
            HStack {
                Spacer()
                AddTodoSaveBtn(addToDoVM: addToDoVM, isModalPresented: self.$isModalPresented)
            }
        }
        .padding(20)
        .onAppear() {
            self.selectedDateString = calendarModule.parent.selectedDate.dateToString
            addToDoVM.setDate(calendarModule.parent.selectedDate.dateToString)
            
            if !isDataOn {
                isDataOn = true
                 context.insert(Category(name: "할일1", color: "ff7373"))
//                context.insert(Category(name: "할일2", color: "a2a2d0"))
//                context.insert(Category(name: "할일3", color: "f5cc7f"))
//                context.insert(Category(name: "긴 카테고리 글자에요~~~~", color: "ff7373"))
//                context.insert(Category(name: "할일5", color: "dfc9f1"))
//                
                try! context.save()
            }
        }
    }
    
}
