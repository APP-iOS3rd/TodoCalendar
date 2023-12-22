//
//  CategoryDetailVIew.swift
//  TimeBlock
//
//  Created by 김건호 on 12/21/23.
//
import SwiftUI

struct CategoryDetailView: View {
    var item: CategoryItem    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedColor: Color
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .gray, .brown, .cyan, .mint, .indigo, .teal,.green]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                Form {
                    Section{
                        VStack {
                            // 첫 번째 줄의 원형들
                            HStack(spacing: 20) {
                                ForEach(colors.prefix(7), id: \.self) { color in
                                    Circle()
                                        .fill(color)
                                        .frame(width: circleSize(geometry), height: circleSize(geometry))
                                        .onTapGesture {
                                            selectedColor = color
                                        }
                                }
                            }
                            // 두 번째 줄의 원형들
                            HStack(spacing: 20) {
                                ForEach(colors.dropFirst(7), id: \.self) { color in
                                    Circle()
                                        .fill(color)
                                        .frame(width: circleSize(geometry), height: circleSize(geometry))
                                        .onTapGesture {
                                            selectedColor = color
                                        }
                                }
                            }
                        }
                        
                        HStack{
                            Circle()
                                .fill(item.color)
                                .frame(width: circleSize(geometry), height: circleSize(geometry))
                                .onTapGesture {
                                    selectedColor = item.color
                                }
                            ColorPicker("", selection: $selectedColor)
                                .labelsHidden()
                                .presentationDetents([.large])
                            
                        }
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Circle()
                            .fill(selectedColor)
                            .frame(width: 30, height: 30)
                        Text(item.title)
                            .font(.largeTitle)
                            .foregroundColor(item.color)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    // GeometryReader를 사용하여 원의 크기 계산
    func circleSize(_ geometry: GeometryProxy) -> CGFloat {
        let width = geometry.size.width
        // Form의 너비를 원의 개수로 나누어 각 원의 크기를 계산
        return (width - 200) / 7 // 20은 HStack 내부의 총 간격
    }
    
    // Color를 HEX 문자열로 변환
    func colorToHex(_ color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let hexString = String(format: "#%02lX%02lX%02lX",
                               lroundf(Float(red) * 255),
                               lroundf(Float(green) * 255),
                               lroundf(Float(blue) * 255))
        return hexString
    }
}

