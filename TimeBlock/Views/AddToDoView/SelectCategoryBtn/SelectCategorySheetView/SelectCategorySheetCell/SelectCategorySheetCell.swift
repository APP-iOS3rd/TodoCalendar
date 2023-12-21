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
    
    var category: SampleCategoryModel
            
    var body: some View {
        Button {
            
        } label: {
            HStack() {
                SelectCategorySheetCellCircle(color: category.color)
                Text(category.name)
                    .font(Font.system(size: FONT_SIZE, weight: .bold))
                    .foregroundStyle(.black)
                Spacer()
            }
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: HEIGHT)
        .background(BACKGROUND_COLOR)
        .cornerRadius(RADIUS)
        .padding()
    }
}

#Preview {
    SelectCategorySheetCell(category: SampleCategoryModel())
}
