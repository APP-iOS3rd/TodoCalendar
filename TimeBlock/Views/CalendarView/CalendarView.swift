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

    @State var isDataOn: Bool = false
    @State var selectedDate : Date = Date() 

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
                    AddTodoView(isModalPresented: self.$isModalPresented, isDataOn: self.$isDataOn)
                }
                
                
                VStack {
                    Spacer()
                    CalendarModule(selectedDate: $selectedDate)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    TodoListView(date: $selectedDate)
                }
                Spacer()
                
            }
            //.environmentObject(c)
            .environmentObject(CalendarModule.Coordinator(CalendarModule(selectedDate: $selectedDate)))
        }
        
    }
    
    
    
}




//#Preview {
//    CalendarView()
//}
