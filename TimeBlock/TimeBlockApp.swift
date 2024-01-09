//
//  TimeBlockApp.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/3/23.
//

import SwiftData
import SwiftUI

@main
struct TimeBlockApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let container: ModelContainer = {
        let schema = Schema([Task.self, Category.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }() 
    var body: some Scene {
        WindowGroup {
            CalendarView()
                
        }
        .modelContainer(container)
    }
}


