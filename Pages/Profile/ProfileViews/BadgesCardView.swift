//
//  BadgesCardView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 29.02.2024.
//

import SwiftUI

struct BadgesCardView: View {
    let items: [Int]
    
    var body: some View {
        
        let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
        ]
        
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Certificates")
                        .font(Font.custom("Poppins", size: 22).weight(.semibold))
                    
                    Text("View your progresss")
                        .font(Font.custom("Poppins", size: 22).weight(.medium))
                        .foregroundColor(Color(red: 0.72, green: 0.72, blue: 0.78))
                }
                
                Spacer()
            }
            .padding(.leading, 30)
            
            VStack(spacing: 0) {
                ZStack {
                    CardShape()
                        .fill(Color.gray.opacity(0.05))
                        .frame(width: 343, height: 324)
                    
                    // Использование LazyVGrid для создания сетки
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(Badge.allBadges.filter { items.contains($0.id) }) { item in
                                VStack {
                                    Image(item.icon)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    
                                    Text(item.name)
                                        .font(Font.Poppins(size: 14))
                                }
                            }
                            .padding(.bottom, 20)
                            .padding(.top, 20)
                        }
                        .padding(.leading, 6)
                        .padding(.trailing, 6)
                    }
                    .frame(width: 343, height: 324)
                }
                
                
                ZStack {
                    CardShape()
                        .fill(Color("Badges-card"))
                        .frame(width: 343, height: 68)
                        .rotationEffect(.degrees(180))
                    
                    Text("Earn badges for mastering skills and showcase your achievements in-app.")
                        .foregroundColor(.white)
                        .font(
                            Font.Poppins(size: 16)
                                .weight(.semibold)
                        )
                        .lineSpacing(5)
                        .frame(width: 343, height: 70)
                        .multilineTextAlignment(.center)
                }
                
            }
        }
    }
}

#Preview {
    var user = User(email: "vipkiller.b@mail.ru", firstName: "Evgeniy", lastName: "Bukharev", password: "123456789", avatarImageUrl: "ДорохиеДрузья", bio: "Qwerty")
    return BadgesCardView(items: user.badges)
}
