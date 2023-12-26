//
//  SelectCategorySheetView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI
import SwiftData

struct SelectCategorySheetView: View {
    @Query(sort: [SortDescriptor(\Category.id)]) var categories: [Category]
    @Binding var selectedCategory: Category?
    
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
