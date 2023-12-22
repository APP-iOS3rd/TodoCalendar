//
//  CategoryAddView.swift
//  TimeBlock
//
//  Created by 김건호 on 12/21/23.
//

import SwiftUI

struct CategoryDetailView: View {
    var item: CategoryItem

    var body: some View {
        Text("Details for \(item.title)")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

//#Preview {
//    CategoryAddView()
//}
