//
//  AddTodoView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    @EnvironmentObject var calendarModule: CalendarModule
    @StateObject var addToDoVM = AddToDoVM()
    @Binding var isModalPresented: Bool
    
    @Binding var isDataOn: Bool
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
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
                Text("\(calendarModule.selectedDate.dateToString)")
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
            addToDoVM.setDate(calendarModule.selectedDate.dateToString)
            if !isDataOn {
                isDataOn = true
                context.insert(Category(name: "할일1", color: "ff7373"))
                context.insert(Category(name: "할일2", color: "a2a2d0"))
                context.insert(Category(name: "할일3", color: "f5cc7f"))
                context.insert(Category(name: "긴 카테고리 글자에요~~~~", color: "ff7373"))
                context.insert(Category(name: "할일5", color: "dfc9f1"))
                
                try! context.save()
            }
        }
    }
    
}

//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Category.self, configurations: config)
//
//    container.mainContext.insert(Category(name: "할일1", color: "ff7373"))
//    container.mainContext.insert(Category(name: "할일2", color: "a2a2d0"))
//    container.mainContext.insert(Category(name: "할일3", color: "f5cc7f"))
//    container.mainContext.insert(Category(name: "긴 카테고리 글자에요~~~~", color: "ff7373"))
//    container.mainContext.insert(Category(name: "할일5", color: "dfc9f1"))
//
//    return AddTodoView()
//        .modelContainer(container)
//}

