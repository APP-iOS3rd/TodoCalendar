//
//  TabBarView.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/17/23.
//

import SwiftData
import SwiftUI

struct TabBarView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showingPopover = false
    @State public var tabViewSelection = 1
    
    
    @State private var path = [ToDo]()
    @State private var sortOrder = SortDescriptor(\ToDo.category)
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            TabView(selection: $tabViewSelection){
                NavigationView{
                    CalendarView()
                }.tag(0)
                .tabItem {
                    Image(systemName: "calendar")
                        .resizable()
                    Text("캘린더")
                }
                
                NavigationView{
                    NavigationStack(path: $path){
                        ToDoListView()
                           // .navigationDestination(for: ToDo.self, destination: ToDoDetailView())
                           // .searchable(text: $searchText)
                    }
                }.tag(1)
                .tabItem {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                    Text("할일")
                }
 
                NavigationView{
                    TagListView()
                    //                NavigationLink{
                    //                    TagListView()
                    //                   // TagListView()
                    //                } label: {
                    //                    Text("hi")
                    //                }
                }.tag(3)
                .tabItem {
                    Image(systemName: "gear")
                        .resizable()
                    Text("설정")
                }
                
            }
        }
    }
}

#Preview {
    TabBarView()
}
