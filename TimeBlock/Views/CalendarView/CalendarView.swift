//
//  CalendarView.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/9/23.
//

import SwiftUI
import PromiseKit
import SwiftData

struct CalendarView:View {
    
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    @State private var isModalPresented = false
    @StateObject var calendarModule = CalendarModule()
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack {
                    Spacer()
                    NavigationLink {
                        // 임시 뷰
                        TempSheetView()
                    } label: {
                        Image(systemName: "list.bullet")
                    }
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "calendar.badge.plus")        }
                }
                .padding(.trailing)
                .sheet(isPresented: $isModalPresented) {
                    AddTodoView(isModalPresented: self.$isModalPresented)
                }
                
                
                VStack {
                    Spacer()
                    CalendarModuleView()
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    TodoListView(date: $calendarModule.selectedDate)
                }
                Spacer()
                
            }
            .environmentObject(calendarModule)
        }
        
    }
    
    
    
}




//#Preview {
//    CalendarView()
//}
