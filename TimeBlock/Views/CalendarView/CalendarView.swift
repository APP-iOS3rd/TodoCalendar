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
                HStack (spacing: 20){
                 Spacer()
                    
                    NavigationLink {
                        SearchView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24,height: 24)
                           
                    }
                    
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "calendar.badge.plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24,height: 24)
                            
                    }
                    
                }
                .padding(.trailing)
                .sheet(isPresented: $isModalPresented) {
                    AddTodoView(isModalPresented: self.$isModalPresented)
                }
                
                
                VStack {
                    Spacer()
                    CalendarModuleViewController()
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
