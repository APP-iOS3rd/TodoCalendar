//
//  AddToDoTextField.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct AddToDoTextField: View {
    let PLACE_HOLDER = "일정 제목"
    @Binding var content: String
    
    var body: some View {
        TextField(PLACE_HOLDER, text: $content)
    }
}

#Preview {
    AddToDoTextField(content: .constant(""))
}
