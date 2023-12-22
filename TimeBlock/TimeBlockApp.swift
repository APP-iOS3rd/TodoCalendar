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
    var body: some Scene {
        WindowGroup {
            // MainView(viewRouter: ViewRouter())
            MainView(viewRouter: ViewRouter())
        }
        .modelContainer(for: [ToDo.self, Category.self])
    }
}


