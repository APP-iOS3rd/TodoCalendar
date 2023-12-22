//
//  SelectCategoryBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategoryBtn: View {
    let HEIGHT: CGFloat = 26
    let RADIUS: CGFloat = 25
    let SACALE_FACTOR: CGFloat = 0.5
    let TEXT_PADDING: CGFloat = 10
    let SHEET_HEIGHT_RATIO: Double = 0.4
    
    
    @Binding var selectedCategory: Category
    @State var isShownSheet = false
    var categories: [Category]
                                
    var body: some View {
        Button {
            self.isShownSheet.toggle()
        } label: {
            Text(selectedCategory.name)
                .foregroundColor(.white)
                .minimumScaleFactor(SACALE_FACTOR)
                .padding(.horizontal, TEXT_PADDING)
        }
        .sheet(isPresented: $isShownSheet) {
            SelectCategorySheetView(categories: categories, selectedCategory: self.$selectedCategory)
                .presentationDetents([.fraction(SHEET_HEIGHT_RATIO)])
        }
        .frame(height: HEIGHT, alignment: .center)
        .background(Color(hex: selectedCategory.color))
        .cornerRadius(RADIUS)
    }
}

//#Preview {
//    SelectCategoryBtn(categories: [
//        Category(name: "할일1", color: "ff7373"),
//        Category(name: "할일2", color: "a2a2d0"),
//        Category(name: "할일3", color: "f5cc7f"),
//        Category(name: "할일4", color: "88bf8d"),
//        Category(name: "할일5", color: "dfc9f1"),
//    ],
//                      
//    selectedCategory: .constant(Category(name: "할일1", color: "ff7373"))
//    )
//}
