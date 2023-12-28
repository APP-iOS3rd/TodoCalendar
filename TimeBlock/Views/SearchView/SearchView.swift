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
    
    var body: some View {
        List(filteredDatas){ data in
            Section{
                VStack{
                    Text(data.title)
                    Text(data.category?.name ?? "없음")
                }
            } header: {
                Text(data.date ?? "")
            }
 
        }
        .searchable(text: $searchText)
    }
}

 
#Preview {
    SearchView()
}
