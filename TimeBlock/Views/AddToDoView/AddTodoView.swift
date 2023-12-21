//
//  AddTodoView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct AddTodoView: View {
    var categories: [SampleCategoryModel]
    @State var selectedCategory: SampleCategoryModel
    @State var content = ""
    
    init(categories: [SampleCategoryModel]) {
        self.categories = categories
        self.selectedCategory = categories.first ?? SampleCategoryModel()
    }
    
    var body: some View {
        VStack {
            HStack {
                SelectCategoryBtn(categories: self.categories, selectedCategory: $selectedCategory)
                Spacer()
            }
            .padding(.bottom, 20)
                                    
            AddToDoTextField(content: $content)
        }
        .padding()
    } 
}

#Preview {
    AddTodoView(categories: [
        SampleCategoryModel(name: "할일1", color: .red),
        SampleCategoryModel(name: "할일2", color: .blue),
        SampleCategoryModel(name: "할일3", color: .green),
        SampleCategoryModel(name: "할일4", color: .purple),
        SampleCategoryModel(name: "할일5", color: .pink),
    ])
}
