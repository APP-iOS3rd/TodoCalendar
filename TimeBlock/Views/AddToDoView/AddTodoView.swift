//
//  AddTodoView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    let PADDING: CGFloat = 20
    
    @Query var categories: [Category]
    @State var selectedCategory: Category = Category()
    @State var content = ""
    
    @StateObject var calendarModule = CalendarModule()
    
    var body: some View {
        VStack {
            HStack {
                SelectCategoryBtn(selectedCategory: $selectedCategory, categories: self.categories)
                Spacer()
            }
            .padding(.bottom, PADDING)
            AddToDoTextField(content: $content)
            if let date = calendarModule.selectedDate {
                Text("선택된 날짜: \(date.dateToString)")
                    .padding()
            } else {
                Text("아직 날짜를 선택하지 않았습니다.")
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Category.self, configurations: config)
    
    container.mainContext.insert(Category(name: "할일1", color: "ff7373"))
    container.mainContext.insert(Category(name: "할일2", color: "a2a2d0"))
    container.mainContext.insert(Category(name: "할일3", color: "f5cc7f"))
    container.mainContext.insert(Category(name: "긴 카테고리 글자에요~~~~", color: "ff7373"))
    container.mainContext.insert(Category(name: "할일5", color: "dfc9f1"))

    return AddTodoView()
        .modelContainer(container)
}

