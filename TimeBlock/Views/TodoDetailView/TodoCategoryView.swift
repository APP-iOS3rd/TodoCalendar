//
//  TodoCategoryView.swift
//  TimeBlock
//
//  Created by 이민호 on 12/26/23.
//

import SwiftUI

struct TodoCategoryView: View {
    var category: Category?
    
    var body: some View {
        Text(category?.name ?? "")
        .foregroundColor(.white)
        .minimumScaleFactor(0.5)
        .padding(.horizontal, 10)
        .frame(height: 26, alignment: .center)
        .background(Color(hex: category?.color ?? "a2a2d0"))
        .cornerRadius(25)
    }
}

#Preview {
    TodoCategoryView(category: Category(name: "기념일", color: "a2a2d0"))
}
