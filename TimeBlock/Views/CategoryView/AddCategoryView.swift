//
//  AddCategoryView.swift
//  TimeBlock
//
//  Created by 김건호 on 12/27/23.
//
import SwiftUI

struct AddCategoryView: View {
    @State private var categoryName: String = ""
    @State private var selectedColor: Color = .red
    @Environment(\.presentationMode) var presentationMode
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .gray, .brown, .cyan, .mint, .indigo, .teal, .green]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                
                Form {
                    Section(header: Text("카테고리 이름")) {
                        TextField("카테고리 이름을 입력해주세요", text: $categoryName)
                    }
                    
                    Section(header: Text("색상 추가")) {
                        
                            ColorSectionView(selectedColor: $selectedColor, colors: colors, geometry: geometry)
                            ColorPicker("", selection: $selectedColor)
                                .labelsHidden()
                            
                        
                        
                    }
                    
                    Section {
                        Button("Add Category") {
                            addNewCategory()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationBarTitle("Add Category")
        }
    }
    
    // 카테고리 추가
    func addNewCategory() {
        let colorString = colorToHex(selectedColor)
        let newCategory = Category(name: categoryName, color: colorString)
        
    }
    
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



