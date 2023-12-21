//
//  SelectCategorySheetCellCircle.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct SelectCategorySheetCellCircle: View {
    private let SIZE: CGFloat = 25
    
    var color: Color
        
    var body: some View {
        Circle()
            .frame(width: self.SIZE, height: self.SIZE)
            .foregroundColor(color)
    }
}

#Preview {
    SelectCategorySheetCellCircle(color: .red)
}
