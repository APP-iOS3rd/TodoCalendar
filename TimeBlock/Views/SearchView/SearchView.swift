//
//  SearchView.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/26/23.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Query var todoData: [ToDoData]
    @State private var searchText = ""
    
    var filteredDatas: [ToDoData] {
        if searchText.isEmpty {
            return todoData
        } else {
            return todoData.filter { data in
                // 먼저 date에 대한 검사
                let isDateMatch = data.date.localizedStandardContains(searchText)
                
                // 그 다음 task 항목들에 대한 검사
                let isTaskMatch = data.task.contains { task in
                    task.title.localizedStandardContains(searchText) ||
                    (task.category?.name ?? "").localizedStandardContains(searchText)
                }
                
                // date 또는 task 중 하나라도 조건에 맞으면 해당 데이터를 포함
                return isDateMatch || isTaskMatch
            }
           // return todoData.filter { $0.date.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        List(filteredDatas){ data in
            Section{
                ForEach(data.task, id:\.self){ todo in
                    VStack{
                        Text(todo.title)
                        Text(todo.category?.name ?? "없음")
                    }
                }
                
            } header: {
                Text(data.date)
            }
 
        }
        .searchable(text: $searchText)
    }
}

 
#Preview {
    SearchView()
}
