//
//  SelectCategorySheetView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategorySheetView: View {
    var categories: [Category]
    @Binding var selectedCategory: Category
    
    var body: some View {
        List {
            ForEach(categories, id: \.self) { category in
                SelectCategorySheetCell(selectedCategory: $selectedCategory, category: category)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        self.selectedCategory = category
                    }
            }
        }
        .listStyle(.plain)
    }
}

//#Preview {
//    SelectCategorySheetView(categories: [
//        Category(name: "할일1", color: "ff7373"),
//        Category(name: "할일2", color: "a2a2d0"),
//        Category(name: "할일3", color: "f5cc7f"),
//        Category(name: "할일4", color: "88bf8d"),
//        Category(name: "할일5", color: "dfc9f1"),
//    ],
//    
//    selectedCategory: .constant(Category(name: "할일", color: "ff7373"))
//    )
//}
