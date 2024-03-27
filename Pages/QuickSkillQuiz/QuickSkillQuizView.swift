//
//  QuickSkillQuizView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 01.03.2024.
//

import SwiftUI

struct QuickSkillQuizView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.yellow)
                .frame(width: 358.81, height: 290)
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 6, y: 4
                )
                .overlay(content: {
                        Text("👨‍💻On development stage👷‍♂️")
                        .font(.title)
                    
                })
        }
    }
}

#Preview {
    QuickSkillQuizView()
}
