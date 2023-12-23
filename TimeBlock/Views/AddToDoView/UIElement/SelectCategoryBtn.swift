//
//  SelectCategoryBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI
import SwiftData

struct SelectCategoryBtn: View {
    @Binding var selectedCategory: Category?
    @State var isShownSheet = false
        
    var body: some View {
        Button {
            self.isShownSheet.toggle()
        } label: {
            Text(selectedCategory?.name ?? "카테고리를 선택하세요")
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 10)
        }
        .sheet(isPresented: $isShownSheet) {
            SelectCategorySheetView(selectedCategory: self.$selectedCategory)
                .presentationDetents([.fraction(0.4)])
        }
        .frame(height: 26, alignment: .center)
        .background(Color(hex: selectedCategory?.color ?? "a2a2d0"))
        .cornerRadius(25)
    }
}
