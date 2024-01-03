//
//  AddCategoryBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 1/3/24.
//

import SwiftUI

struct AddCategoryBtn: View {
    @State var isShowingAddCategoryView = false
    
    var body: some View {
        Button {
            isShowingAddCategoryView.toggle()
        } label: {
            HStack {
                Spacer()
                Image(systemName: "plus")
            }
            .padding()
        }
        .sheet(isPresented: self.$isShowingAddCategoryView) {
            AddCategoryView()
        }
    }
}
