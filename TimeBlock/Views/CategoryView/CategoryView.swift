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
    @State private var showingAddView = false
    @State private var selectedItem: Category?
    @State private var selectedCategory: Category?
    @State private var showingCategoryAddView = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var context
    @Query var tasks: [Task]
    @Binding var task: Task

    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { category in
                    HStack {
                        Image(systemName: selectedCategory == category ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(Color(hex: category.color))
                        Text(category.name)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "info.circle")
                            .onTapGesture {
                                showingAddView = true
                            }
                    }
                    .onTapGesture {
                        self.task.category = category
                        self.selectedCategory = category
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .sheet(item: $selectedItem, onDismiss: nil) { item in
                if items.firstIndex(where: { $0.id == item.id }) != nil {
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
        .onAppear {
            self.selectedCategory = self.task.category
        }
    }

    func canDeleteCategory(_ category: Category) -> Bool {
        !tasks.contains {task in
            task.category == category
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
