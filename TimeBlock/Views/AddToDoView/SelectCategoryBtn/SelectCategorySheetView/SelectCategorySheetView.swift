//
//  SelectCategorySheetView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategorySheetView: View {
    var categories: [SampleCategoryModel]
    @State var selectedCategory: SampleCategoryModel?
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(categories, id: \.self) { category in
                SelectCategorySheetCell(category: category)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        selectedCategory = category
                    }
            }
        }
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
        ]
    )
}
