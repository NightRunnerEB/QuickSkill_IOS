//
//  ProgressCircleView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 28.02.2024.
//

import SwiftUI

struct ProgressCircleView: View {
    
    let tasksCount: Int
    @State var progress: Int

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .foregroundColor(Color("Purple"))
                .opacity(0.13)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(progress) / CGFloat(tasksCount))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("Purple"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
            
            Text(String(format: "%.0f%%", CGFloat(progress) / CGFloat(tasksCount) * 100))
                .font(Font.Poppins(size: 22).weight(.bold))
                .foregroundColor(.black)
        }
    }
}
