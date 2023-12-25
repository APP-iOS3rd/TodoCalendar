//
//  CalendarView.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/22.
//

import SwiftUI
import PromiseKit
import CoreLocation
import SwiftData

struct CalendarView2:View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    @State private var isModalPresented = false
    @StateObject var calendarModule = CalendarModule()
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack {
                    Spacer()
                    Button{
                        context.insert(Category(name: "할일1", color: "ff7373"))
                        context.insert(Category(name: "할일2", color: "a2a2d0"))
                        context.insert(Category(name: "할일3", color: "f5cc7f"))
                        context.insert(Category(name: "긴 카테고리 글자에요~~~~", color: "ff7373"))
                        context.insert(Category(name: "할일5", color: "dfc9f1"))
                        
                        try! context.save()
                        dismiss()
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                   }
                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Image(systemName: "calendar.badge.plus")        }
                }
                .padding(.trailing)
                .sheet(isPresented: $isModalPresented) {
                            AddTodoView()                          
                }
                
                VStack {
                    Spacer()
                    CalendarModuleView()
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    Text("Details")
                    Spacer()
                }
                Spacer()
            }
            .environmentObject(calendarModule)
        }
        
    }
    
}


#Preview {
    CalendarView2()
}
