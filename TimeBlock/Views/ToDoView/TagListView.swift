//
//  TagListView.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/19/23.
//

import SwiftUI
import SwiftData


struct TagListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var tags: [Tag]
    
    @State private var input: String = ""
    
    var body: some View {
        
        VStack{
            List{
                    
                ForEach(tags){ tag in
                    if tag.editMode {
                        HStack{
                            TextField("update", text: $input)
                                .onAppear(){
                                    tag.name = input
                                }
                            Button("저장"){
                                updateTag(tag)
                            }
                        }
                    }
                    else {
                        HStack{
                            Text(tag.name)
                                .onTapGesture {
                                    changeEditMode(tag)
                                }
                            
                        }
                    }
                }
                .onDelete(perform: { IndexSet in
                    for index in IndexSet {
                        deleteTag(tags[index])
                    }
                })
            }
           
            
            
            Button {
                addTag()
            } label: {
                Text("add tag")
            }
        }
    }
    
    
    func addTag(){
        let tag = Tag()
        modelContext.insert(tag)
        
        // tags.append(tag)
    }
    func changeEditMode(_ tag: Tag){
        print("수정모드")
        tag.editMode = true
        input = tag.name
    }
    
    func updateTag(_ tag: Tag){
        tag.name = input
        
        if tag.name.isEmpty {
            deleteTag(tag)
        }
        try? modelContext.save()
        tag.editMode = false
        input = ""
    }
    
    func deleteTag(_ tag: Tag){
        modelContext.delete(tag)
        // 태그 삭제시, 할일 삭제 시키기
    }
}
