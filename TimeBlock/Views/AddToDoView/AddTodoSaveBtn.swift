//
//  AddTodoSaveBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 12/22/23.
//

import SwiftUI

struct AddTodoSaveBtn: View {
    private let BTN_TEXT = "저장"
    private let MARK = "checkmark"
    private let TEXT_COLOR: Color = .white
    private let BTN_BACK_COLOR: Color = .black
    private let MARK_SIZE: CGFloat = 15
    private let FONT_SIZE: CGFloat = 20
    private let HEIGHT: CGFloat = 50
    private let RADIUS: CGFloat = 33
    private let SACALE_FACTOR: Double = 0.5
                                
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: MARK)
                    .font(.system(size: MARK_SIZE))
                    .foregroundColor(TEXT_COLOR)
                
                Text(BTN_TEXT)
                    .foregroundStyle(TEXT_COLOR)
                    .font(Font.system(size: FONT_SIZE, weight: .bold))
            }
            .minimumScaleFactor(SACALE_FACTOR)
            .padding()
        }
        .frame(height: HEIGHT)
        .background(BTN_BACK_COLOR)
        .cornerRadius(RADIUS)
    }
}

#Preview {
    AddTodoSaveBtn()
}
