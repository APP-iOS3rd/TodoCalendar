//
//  SearchView.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/26/23.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Query var tasks: [Task]
    @State private var searchText = ""
    
    var filteredDatas: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            return tasks.filter { task in
                // 먼저 date에 대한 검사
                let isDateMatch = task.date?.localizedStandardContains(searchText)
                // 그 다음 task 항목들에 대한 검사
                let isTaskMatch = task.title.localizedStandardContains(searchText) ||
                (task.category?.name ?? "").localizedStandardContains(searchText)
                
                
                // date 또는 task 중 하나라도 조건에 맞으면 해당 데이터를 포함
                if let isDateMatch {
                    return isDateMatch || isTaskMatch
                }
                return false
            }
        }
    }
    
    // 날짜별로 Task를 그룹화하는 계산 속성
    var groupedTasks: [String: [Task]] {
        Dictionary(grouping: filteredDatas, by: { $0.date ?? "" })
    }
    
    var body: some View {
        List {
            ForEach(groupedTasks.keys.sorted(), id: \.self) { date in
                Section(header: Text(date)) {
                    ForEach(groupedTasks[date] ?? [], id: \.self) { task in
                        VStack {
                            Text(task.title)
                            Text(task.category?.name ?? "없음")
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
        
    }
}


#Preview {
    SearchView()
}
