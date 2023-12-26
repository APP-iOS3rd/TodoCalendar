//
//  TimeBlockApp.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/3/23.
//

import SwiftData
import SwiftUI

//@main
//struct TimeBlockApp: App {
//    var body: some Scene {
//        WindowGroup {
//            MainView(viewRouter: ViewRouter())
//        }
//        .modelContainer(for: ToDo.self)
//    }
//}

@main
struct TimeBlockApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([ToDoData.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
          //  MainView(viewRouter: ViewRouter())
            CalendarView()
        
        }
        .modelContainer(container)
//        .modelContainer(for: [ToDo.self, Category.self])
    }
}


