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
    @State private var selectedItem: Category? // selectedItem을 옵셔널로 변경
    @State private var showingCategoryAddView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(hex: items[index].color)) // Color 변환
                        Text(items[index].name) // title을 name으로 변경
                            .font(.title3)
                        Spacer()
                        Image(systemName: "info.circle")
                            .onTapGesture {
                                selectedItem = items[index]
                                showingAddView = true
                                print(selectedItem)
                            }
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
//    // 카테고리를 삭제하는 함수
//    private func deleteCategory(_ category: Category, from container: ModelContainer) {
//        // 데이터베이스에서 category 객체 삭제
//        container.delete(category) { result in
//            switch result {
//            case .success():
//                print("Category successfully deleted.")
//                // 뷰 상태 업데이트
//                // 필요한 경우 여기에서 뷰를 갱신합니다.
//            case .failure(let error):
//                print("Error deleting category: \(error)")
//            }
//        }
//    }
//
    // 사용자가 스와이프로 삭제를 요청했을 때 호출되는 함수
    func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            let categoryToDelete = items[index]
//            deleteCategory(categoryToDelete, from: container) // 카테고리 삭제 함수 호출
        }
    }

}
