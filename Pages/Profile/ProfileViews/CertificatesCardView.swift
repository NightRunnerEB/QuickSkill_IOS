//
//  CertificatesCardView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 29.02.2024.
//

import SwiftUI

struct CertificatesCardView: View {
    let items: [Int]
    
    var body: some View {
        
        let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
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

                            ForEach(Certificate.allCertificates.filter { items.contains($0.id) }) { item in
                                VStack(alignment: .center) {
                                    Image(item.icon)
                                    
                                    Text(item.title) // Замените на ваше представление элемента
                                        .font(Font.Poppins(size: 17))
                                }
                            }
                            .padding(.bottom, 20)
                            .padding(.top, 20)
                        }
                        .padding()
                    }
                    .frame(width: 343, height: 324)
                }
                
                
                ZStack {
                    CardShape()
                        .fill(Color("Certificates-card"))
                        .frame(width: 343, height: 68)
                        .rotationEffect(.degrees(180))
                    
                    Text("QuickSkill presents your certificates")
                        .foregroundColor(.white)
                        .font(
                            Font.custom("Poppins", size: 17)
                                .weight(.semibold)
                        )
                }
                
            }
        }
    }
}

#Preview {
    var user = User(email: "vipkiller.b@mail.ru", firstName: "Evgeniy", lastName: "Bukharev", password: "123456789", avatarImageUrl: "ДорохиеДрузья", bio: "Qwerty")
    return CertificatesCardView(items: user.certificates)
}
