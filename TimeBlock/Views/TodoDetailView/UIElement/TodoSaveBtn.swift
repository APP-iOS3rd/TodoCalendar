//
//  TodoSaveBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 1/3/24.
//

import SwiftUI

struct TodoSaveBtn: View {
    @Binding var isShownSheet: Bool
    @Binding var task: Task
    @Binding var date: Date
    
    var body: some View {
        Button {
            task.setDate(date.dateToString)
            isShownSheet.toggle()
        } label: {
            SaveBtnContent(systemName: "checkmark", btnText: "저장")
                .padding()
        }
        .buttonStyle(SaveBtnStyle())
    }
}
