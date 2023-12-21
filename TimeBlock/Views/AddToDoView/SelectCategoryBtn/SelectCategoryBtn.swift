//
//  SelectCategoryBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategoryBtn: View {
    var categories: [SampleCategoryModel]
    @State var selectedCategory: SampleCategoryModel
    @State var isShownSheet = false
        
    init(categories: [SampleCategoryModel]) {
        self.categories = categories
        self.selectedCategory = categories.first ?? SampleCategoryModel()
    }
    
    var width: CGFloat = 60
    var height: CGFloat = 26
    
    var body: some View {
        Button {
            self.isShownSheet.toggle()
        } label: {
            Text(selectedCategory.name)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $isShownSheet) {
            SelectCategorySheetView(categories: categories, selectedCategory: self.$selectedCategory)
                .presentationDetents([.fraction(0.4)])
        }
        .frame(width: self.width, height: self.height, alignment: .center)
        .background(selectedCategory.color)
        .cornerRadius(25)
    }
}

#Preview {
    SelectCategoryBtn(categories: [
        SampleCategoryModel(name: "할일1", color: .red),
        SampleCategoryModel(name: "할일2", color: .blue),
        SampleCategoryModel(name: "할일3", color: .green),
        SampleCategoryModel(name: "할일4", color: .purple),
        SampleCategoryModel(name: "할일5", color: .pink),
    ])
}
