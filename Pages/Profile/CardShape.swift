//
//  CardShape.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 29.02.2024.
//

import SwiftUI

struct CardShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            let cornerRadius: CGFloat = 24
            // Начинаем с левого верхнего угла
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            // Добавляем линию к правому верхнему углу
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            // Добавляем дугу для верхнего правого угла
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius,
                        startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
            // Добавляем линию к правому нижнему углу
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            // Добавляем линию к левому нижнему углу
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            // Добавляем дугу для верхнего левого угла
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius,
                        startAngle: Angle(degrees: 180), endAngle: Angle(degrees: -90), clockwise: false)
        }
    }
}

#Preview {
    CardShape()
        .frame(width: 300, height: 200) // Общая высота всего заголовка
}
