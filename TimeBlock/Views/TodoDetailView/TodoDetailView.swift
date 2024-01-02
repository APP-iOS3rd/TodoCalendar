//
//  TodoDetailView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI
import SwiftData

struct TodoDetailView: View {
    @Binding var isShownSheet: Bool
    @Binding var task: Task
    @Binding var date: Date
    
    @State var showDateSheet: Bool = false
    
    var isDateWheelSheet: Bool = false
        
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading, spacing: 22) {
                    HStack {
                        TodoCategoryView(task: self.$task)
                            .padding(.top, 20)
                                                    
                        Spacer()
                        
                        TodoDeleteBtn(isShownSheet: self.$isShownSheet, task: self.task, date: self.date)
                    }
                    
                    // MARK: - 일정 수정 가능
                    TextField("일정 제목", text: $task.title)
                        .font(.system(size: 29, weight: .bold))
                                                        
                    Text(date.dateToString )
                        .font(.system(size: 18, weight: .semibold))
                        .onTapGesture {
                            print("taping")
                            showDateSheet.toggle()
                        }
                        .sheet(isPresented: $showDateSheet) {
                            DatePickerView(date: $date, showDateSheet: $showDateSheet)
                        }
                    
                    Button {
                        task.setDate(date.dateToString)
                    } label: {
                        Text("저장하기")
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}
