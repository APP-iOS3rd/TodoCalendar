//
//  TodoCompleteBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 1/2/24.
//

import SwiftUI

struct TodoCompleteBtn: View {
    @Binding var task: Task
    
    var body: some View {
        Button {
            task.completed.toggle()
        } label: {
            if task.completed {
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    
            } else {
                Image(systemName: "circle")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
            }
        }
    }
}

