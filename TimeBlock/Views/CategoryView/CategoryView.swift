//
//  CategoryView.swift
//  TimeBlock
//
//  Created by 김건호 on 12/21/23.
//
import SwiftUI
import SwiftData

struct CategoryView: View {
    @Query(sort: [SortDescriptor(\Category.id)]) var items: [Category]
    @Query var toDoData: [ToDoData]
    @State private var showingAddView = false
    @State private var selectedItem: Category?
    @State private var showingCategoryAddView = false
    @Environment(\.modelContext) var context
    @Binding var task: Task

    var body: some View {
        NavigationStack {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(hex: items[index].color))
                        Text(items[index].name)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "info.circle")
                            .onTapGesture {
                                showingAddView = true
                            }
                    }
                    .onTapGesture {
                        self.task.category = items[index]
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .sheet(item: $selectedItem, onDismiss: nil) { item in
                if let index = items.firstIndex(where: { $0.id == item.id }) {
                    CategoryDetailView(category: item, selectedColor: Color(hex: item.color))
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

    func canDeleteCategory(_ category: Category) -> Bool {
        !toDoData.contains { todo in
            todo.task.contains { task in
                task.category == category
            }
        }
    }

    func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let categoryToDelete = items[index]
            if canDeleteCategory(categoryToDelete) {
                context.delete(categoryToDelete)
            } else {
                
            }
        }

        do {
            try context.save()
        } catch {
            print("Error saving context after deleting category: \(error)")
        }
    }
}
