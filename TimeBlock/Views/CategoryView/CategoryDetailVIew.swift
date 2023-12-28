//
//  CategoryDetailVIew.swift
//  TimeBlock
//
//  Created by 김건호 on 12/21/23.
//
import SwiftUI

struct CategoryDetailView: View {
    @State var category: Category // Category 모델 사용
    @Environment(\.presentationMode) var presentationMode
    @State var selectedColor: Color
    @State private var isEditingTitle = false

    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .gray, .brown, .cyan, .mint, .indigo, .teal, .green]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                Form {
                    Section {
                        ColorSectionView(selectedColor: $selectedColor, colors: colors, geometry: geometry)
                        HStack {
                            Circle()
                                .fill(selectedColor)
                                .frame(width: circleSize(geometry), height: circleSize(geometry))
                                .onTapGesture {
                                    // 선택된 색상을 현재 카테고리의 색상으로 변경
                                    selectedColor = Color(hex: category.color)
                                }
                            
                            ColorPicker("", selection: $selectedColor)
                                .labelsHidden()
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Spacer().frame(height: 30)
                        HStack {
                            Circle()
                                .fill(selectedColor)
                                .frame(width: 30, height: 30)
                            if isEditingTitle {
                                TextField("Enter Title", text: $category.name)
                                    .padding(.all, 20)
                                    .font(.largeTitle)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .onSubmit {
                                        isEditingTitle = false
                                    }
                            } else {
                                Text(category.name)
                                    .font(.largeTitle)
                                    .onTapGesture {
                                        isEditingTitle = true
                                    }
                            }
                        }
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
        .onAppear {
            selectedColor = Color(hex: category.color)
        }
    }
    
    func circleSize(_ geometry: GeometryProxy) -> CGFloat {
        let width = geometry.size.width
        return (width - 200) / 7
    }
    
    func colorToHex(_ color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return String(format: "#%02lX%02lX%02lX",
                      lroundf(Float(red) * 255),
                      lroundf(Float(green) * 255),
                      lroundf(Float(blue) * 255))
    }
}
