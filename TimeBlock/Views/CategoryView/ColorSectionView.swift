//
//  ColorSectionView.swift
//  TimeBlock
//
//  Created by 김건호 on 12/28/23.
//
import SwiftUI

struct ColorSectionView: View {
    @Binding var selectedColor: Color
    let colors: [Color]
    let geometry: GeometryProxy

    var body: some View {
        colorSelectionView(geometry: geometry)
    }

    private func colorSelectionView(geometry: GeometryProxy) -> some View {
        VStack {
            ForEach(0..<colors.count / 7 + colors.count % 7, id: \.self) { rowIndex in
                HStack(spacing: 20) {
                    ForEach(0..<7) { columnIndex in
                        let colorIndex = rowIndex * 7 + columnIndex
                        if colorIndex < colors.count {
                            Circle()
                                .fill(colors[colorIndex])
                                .frame(width: circleSize(geometry), height: circleSize(geometry))
                                .overlay(
                                    Circle()
                                        .stroke(selectedColor == colors[colorIndex] ? Color.blue : Color.clear, lineWidth: 3)
                                )
                                .onTapGesture {
                                    selectedColor = colors[colorIndex]
                                }
                        }
                    }
                }
            }
        }
    }

    private func circleSize(_ geometry: GeometryProxy) -> CGFloat {
        let width = geometry.size.width
        return (width - 200) / 7
    }
}
