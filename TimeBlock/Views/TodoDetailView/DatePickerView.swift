//
//  DatePickerView.swift
//  TimeBlock
//
//  Created by 이민영 on 2023/12/28.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    @Binding var showDateSheet: Bool
    
    var body: some View {
        VStack {
            DatePicker("DatePicker", selection: $date, displayedComponents: .date)
                .datePickerStyle(.graphical)
        }
        .presentationDetents([ .medium, .large])
        .presentationBackground(.white)
    
    }
}
