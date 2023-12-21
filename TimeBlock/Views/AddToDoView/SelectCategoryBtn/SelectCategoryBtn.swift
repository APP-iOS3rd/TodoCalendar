//
//  SelectCategoryBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategoryBtn: View {
    @Binding var category: SampleCategoryModel
    @State var isShownSheet = false
    var categories: [SampleCategoryModel]
    
    var width: CGFloat = 60
    var height: CGFloat = 26
    
    var body: some View {
        Button {
            self.isShownSheet.toggle()
        } label: {
            Text(category.name)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $isShownSheet) {
            SelectCategorySheetView(categories: self.categories)
                .presentationDetents([.fraction(0.4)])
        }
        .frame(width: self.width, height: self.height, alignment: .center)
        .background(category.color)
        .cornerRadius(25)
    }
}

#Preview {
    SelectCategoryBtn(category: .constant(SampleCategoryModel()), categories: [
        SampleCategoryModel(name: "할일1", color: .red),
        SampleCategoryModel(name: "할일2", color: .blue),
        SampleCategoryModel(name: "할일3", color: .green),
        SampleCategoryModel(name: "할일4", color: .purple),
        SampleCategoryModel(name: "할일5", color: .pink),
    ])
}
