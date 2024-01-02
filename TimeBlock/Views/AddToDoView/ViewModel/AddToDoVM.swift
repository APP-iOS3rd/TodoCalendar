//
//  AddToDoVM.swift
//  SwifDataDemo
//
//  Created by 이민호 on 12/22/23.
//

import SwiftUI
import SwiftData

class AddToDoVM: ObservableObject{
    @EnvironmentObject var calenderModule: CalendarModule.Coordinator
    @Published var selectedCategory: Category?
    @Published var title: String = ""
    var date: String = ""
    
    func setDate(_ date: String) {
        self.date = date
    }
}
