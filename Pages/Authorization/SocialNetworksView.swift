//
//  SocialNetworksList.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 20.02.2024.
//

import SwiftUI

struct SocialNetworksView: View {
    
    var body: some View {
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
                
                Spacer()
                
                Text(text)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(10)
        }
    }
}

#Preview {
    SocialNetworksView()
}
