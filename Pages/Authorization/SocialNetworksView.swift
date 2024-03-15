//
//  SocialNetworksList.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 20.02.2024.
//

import SwiftUI

struct SheetContentView: View {
    var body: some View {
        VStack {
            Spacer()
            // Индикатор для свайпа вниз
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 5)
                .foregroundColor(.secondary)

            // Кнопки в модальном окне
            VStack(spacing: 20) {
                SignInButton(text: "Continue with GitHub", imageName: "GitHub Logo")
                SignInButton(text: "Continue with Facebook", imageName: "Facebook Logo")
                SignInButton(text: "Continue with Google", imageName: "Google Logo")
                SignInButton(text: "Continue with Apple", imageName: "Apple Logo")
                    .padding(.bottom, 10)
            }
            .padding(.horizontal, 50)
            .padding(.top, 5)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 20)
        .presentationDetents([.height(320)])
    }
}

struct SignInButton: View {
    var text: String
    var imageName: String

    var body: some View {
        Button(action: {
            // Выполните действие входа здесь
        }) {
            HStack {
                Image(imageName) // Замените на ваше изображение соответствующего логотипа
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)

                Text(text)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(10)
        }
    }
}

#Preview {
    SheetContentView()
}
