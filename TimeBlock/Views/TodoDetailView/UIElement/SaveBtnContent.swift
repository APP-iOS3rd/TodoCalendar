//
//  SaveBtnContent.swift
//  TimeBlock
//
//  Created by 이민호 on 1/3/24.
//

import SwiftUI

struct SaveBtnContent: View {
    let systemName: String
    let btnText: String
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
                .font(.system(size: 15))
                .foregroundColor(.white)
            
            Text(btnText)
                .foregroundStyle(.white)
                .font(Font.system(size: 20, weight: .bold))
        }
        .minimumScaleFactor(0.5)
    }
}

