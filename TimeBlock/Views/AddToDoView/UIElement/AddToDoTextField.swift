//
//  AddToDoTextField.swift
//  TimeBlock
//
//  Created by 이민호 on 12/21/23.
//

import SwiftUI

struct AddToDoTextField: View {
    @Binding var content: String
    
    var body: some View {
        TextField("일정 제목", text: $content)
    }
}
