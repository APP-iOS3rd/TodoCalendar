//
//  CategoryView.swift
//  TimeBlock
//
//  Created by 김건호 on 12/21/23.
//
import SwiftUI

struct CategoryItem: Identifiable {
    let id: Int
    let title: String
    var color: Color
    var isSelected: Bool = false
}

struct CategoryView: View {
    @State private var items = [
        CategoryItem(id: 1, title: "운동", color: .blue),
        CategoryItem(id: 2, title: "집", color: .green),
        CategoryItem(id: 3, title: "강의", color: .red),
        CategoryItem(id: 4, title: "약속", color: .yellow),
        CategoryItem(id: 5, title: "여행", color: .purple)
    ]
    
    
    @State private var showingAddView = false
    @State private var selectedItem: CategoryItem?
    @State private var showingCategoryAddView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Image(systemName:"checkmark.circle.fill")
                            .foregroundColor(items[index].color)
                            .onTapGesture {
                                items[index].isSelected.toggle()
                            }
                        Text(items[index].title)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "info.circle")
                            .onTapGesture {
                                selectedItem = items[index]
                                showingAddView = true
                            }
                    }
                }
            }
            .sheet(item: $selectedItem, onDismiss: nil) { item in
                if let index = items.firstIndex(where: { $0.id == item.id }) {
                    CategoryDetailView(item: item, selectedColor: $items[index].color)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingCategoryAddView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCategoryAddView) {
                AddCategoryView()
            }
        }
    }
    
}



#Preview {
    CategoryView()
}
