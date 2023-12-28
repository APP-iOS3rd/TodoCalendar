//
//  Color+Extensions.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/17/23.
//

import Foundation
import SwiftUI

//extension Color {
//    static let peach = Color(hex: "#ff8882") // #을 제거하고 사용해도 됩니다.
//    static let lightBlue = Color(hex:"E5F4F8")
//    static let lightGreen = Color(hex: "EBF9E5")
//    
//
//}

extension Color {
    // Color를 HEX 문자열로 변환
    var colorToHex: String {
        let uiColor = UIColor(self)
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
