//
//  SelectCategorySheetView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategorySheetView: View {
    var categories: [SampleCategoryModel]
    @Binding var selectedCategory: SampleCategoryModel
    
    var body: some View {
        List {
            ForEach(categories, id: \.self) { category in
                SelectCategorySheetCell(selecteCategory: $selectedCategory, category: category)
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

#Preview {
    SelectCategorySheetView(categories:
        [
            SampleCategoryModel(name: "할일1", color: .red),
            SampleCategoryModel(name: "할일2", color: .blue),
            SampleCategoryModel(name: "할일3", color: .green),
            SampleCategoryModel(name: "할일4", color: .purple),
            SampleCategoryModel(name: "할일5", color: .pink),
        ], selectedCategory: .constant(SampleCategoryModel())
    )
}
