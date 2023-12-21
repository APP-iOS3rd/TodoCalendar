//
//  SelectCategorySheetCell.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategorySheetCell: View {
    private let FONT_SIZE: CGFloat = 20
    private let HEIGHT: CGFloat = 50
    private let RADIUS: CGFloat = 11
    private let BACKGROUND_COLOR: Color = .white
    
    @Binding var selecteCategory: SampleCategoryModel
    var category: SampleCategoryModel
            
    var body: some View {
        HStack() {
            if selecteCategory == category {
                SelectCategorySheetCellCheck(color: category.color)
            } else {
                SelectCategorySheetCellCircle(color: category.color)
            }
                        
            Text(category.name)
                .font(Font.system(size: FONT_SIZE, weight: .bold))
                .foregroundStyle(.black)
            Spacer()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: HEIGHT)
        .background(BACKGROUND_COLOR)
        .cornerRadius(RADIUS)
        .padding()
    }
}

#Preview {
    SelectCategorySheetCell(
        selecteCategory: .constant(SampleCategoryModel(name: "할일1", color: .red)),
        category: SampleCategoryModel(name: "할일1", color: .red)
    )
}
