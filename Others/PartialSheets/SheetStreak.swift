//
//  SheetStreak.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 25.03.2024.
//

import SwiftUI
import PartialSheet

struct SheetStreak_Test: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        HStack {
            Spacer()
            PSButton(
                isPresenting: $isSheetPresented,
                label: {
                    Text("Display the Partial Sheet")
                })
            .padding()
            Spacer()
        }
        .partialSheet(
            isPresented: $isSheetPresented,
            
            content: SheetStreak.init
        )
        .navigationBarTitle("Basic Example")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SheetStreak_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SheetStreak_Test()
        }
        .attachPartialSheetToRoot()
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SheetStreak: View {
    
    var body: some View {
        VStack(spacing: 7) {
            
            Image("streak_ball")
                .resizable()
                .frame(width: 40, height: 52)
            
            Text("Streak")
                .font(Font.Poppins(size: 20).weight(.light))
            .foregroundColor(.black)
            
            Text("Discipline is a key to result. Complete practices\nevery day and improve your skills.")
                .multilineTextAlignment(.center)
            .font(Font.custom("Poppins", size: 13).weight(.medium))
            .foregroundColor(Color.gray)
            
            NavigationLink(destination: ShopView(), label: {
                HStack(spacing: 10.51) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .foregroundStyle(Color("Purple"))
                    
                    Text("Shop")
                        .font(Font.custom("Inter", size: 17).weight(.semibold))
                        .foregroundColor(Color("Purple"))
                }
                .padding(
                    EdgeInsets(top: 13.66, leading: 21.01, bottom: 13.66, trailing: 21.01)
                )
                .frame(width: 134.54, height: 45)
                .background(Color("Background-purple"))
                .cornerRadius(10.51)
            })
            .padding(.top, 5)
            
            Spacer()
                .frame(height: 10)
            
        }
        .padding(.horizontal, 10)
    }
}
