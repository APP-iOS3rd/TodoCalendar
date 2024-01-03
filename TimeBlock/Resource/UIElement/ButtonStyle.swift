//
//  CustomSaveBtn.swift
//  TimeBlock
//
//  Created by 이민호 on 1/3/24.
//

import SwiftUI

struct SaveBtnStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 50)
            .background(.black)
            .cornerRadius(33)
    }
}
