//
//  CardsProView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 25.02.2024.
//

import SwiftUI

struct CardViewFirst: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("PRO")
              .font(Font.Poppins(size: 32))
              .foregroundColor(Color(red: 1, green: 0, blue: 0.2))
              .padding(.bottom, 25)
              .padding(.leading, 35)
            
            ForEach(0..<4) { _ in
                HStack(spacing: 18) {
                    Image("Correct")

                  Text("some staff")
                    .font(Font.Poppins(size: 22.31))
                    
                    Spacer()
                }
                .padding(.bottom, 15.75)
                .padding(.leading, 30)
            }
        }
        .frame(width: 320, height: 325)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct CardViewSecond: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Standard +")
              .font(Font.Poppins(size: 32))
              .foregroundColor(Color(red: 1, green: 0, blue: 0.2))
              .padding(.bottom, 25)
              .padding(.leading, 35)
            
            ForEach(0..<3) { _ in
                HStack(spacing: 18) {
                    Image("Correct")

                  Text("some staff")
                    .font(Font.Poppins(size: 22.31))
                    
                    Spacer()
                }
                .padding(.bottom, 15.75)
                .padding(.leading, 30)
            }
            
            HStack(spacing: 18) {
                Image("Fail")

              Text("some staff")
                .font(Font.Poppins(size: 22.31))
                .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76))
            }
            .padding(.bottom, 15.75)
            .padding(.leading, 30)
            
        }
        .frame(width: 320, height: 325)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    CardViewSecond()
}
