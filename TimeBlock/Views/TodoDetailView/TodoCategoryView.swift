//
//  TodoCategoryView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI

struct TodoCategoryView: View {
    @State var showCategoryView = false
    @Binding var task: Task
    // var category: Category?
    
    var body: some View {
        NavigationStack {
            Button {
                self.showCategoryView.toggle()
            } label: {
                Text(task.category?.name ?? "")
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 10)
                    .frame(height: 26, alignment: .center)
                    .background(Color(hex: task.category?.color ?? "a2a2d0"))
                    .cornerRadius(25)
            }
            .sheet(isPresented: $showCategoryView) {
                CategoryView(task: self.$task)
                    .presentationDetents([.fraction(1.0)])
            }
        }
        
    }
}
