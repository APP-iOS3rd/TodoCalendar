//
//  Color+Extensions.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/17/23.
//

import Foundation
import SwiftUI

extension Color {
    static let peach = Color(hex: "#ff8882") // #을 제거하고 사용해도 됩니다.
    static let lightBlue = Color(hex:"E5F4F8")
    static let lightGreen = Color(hex: "EBF9E5")
    

//    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
//    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
}

//extension LinearGradient {
//    init(_ colors: Color...) {
//        self.init(gradient: Gradient(colors: colors), startPoint: .topTrailing, endPoint: .bottomTrailing)
//    }
//}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
