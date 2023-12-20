//
//  ToDoDetailView.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/18/23.
//

import SwiftUI
import SwiftData


struct ToDoDetailView:View {
    @Binding var title : String
    //@Binding var day: Date
    
    var body: some View {
        VStack{
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical,32)
            
            HStack{
                VStack(spacing:10){
                    Image(systemName: "pencil")
                        .symbolVariant(.fill)
                        .font(.system(size: 24,weight:.bold,design: .rounded))
                        .foregroundStyle(.blue)
                    Text("수정하기")
                }
                .frame(maxWidth:.infinity)
                .padding(.vertical,20)
                .padding(.horizontal,36)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(12)
                
                VStack(spacing:10){
                    Image(systemName: "trash.fill")
                        .symbolVariant(.fill)
                        .font(.system(size: 24,weight:.bold,design: .rounded))
                        .foregroundStyle(.red)
                    Text("삭제하기")
                }
                .frame(maxWidth:.infinity)
                .padding(.vertical,20)
                .padding(.horizontal,36)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(12)
               
                
            }
            
            HStack{
                Image(systemName: "list.clipboard")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 24,weight:.bold,design: .rounded))
                    .foregroundStyle(.yellow)
                Text("메모")
                
            }
            HStack{
                Image(systemName: "list.clipboard")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 24,weight:.bold,design: .rounded))
                    .foregroundStyle(.yellow)
                Text("날짜 바꾸기")
                
            }.onTapGesture {
                print("change!")
            }
         
            HStack{
                Image(systemName: "list.clipboard")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 24,weight:.bold,design: .rounded))
                    .foregroundStyle(.yellow)
                Text("내일로")
                
            }.onTapGesture {
                print("change!")
                
                
                
                
            }
         
            
            
        }
        .padding()
                
    }
    
    func changeDay(){
        
    }
}
