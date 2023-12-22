//
//  SelectCategorySheetCellCircle.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategorySheetCellCircle: View {
    private let SIZE: CGFloat = 25
    private let MARK = "checkmark"
    private let MARK_COLOR: Color = .white
    
    var isClicked: Bool
    var color: Color
                    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: self.SIZE, height: self.SIZE)
                .foregroundColor(color)
            if isClicked {
                Image(systemName: MARK)
                    .font(.system(size: SIZE - 8))
                    .foregroundColor(MARK_COLOR)
            }
        }
        
    }
}

#Preview {
    SelectCategorySheetCellCircle(isClicked: true, color: .red)
}
