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
            
        }
    }
    
}
