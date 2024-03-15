//
//  ContentView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 10.02.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isUserAuthenticated") var isUserAuthenticated: Bool = false
    
    var body: some View {
        if isUserAuthenticated {
            MainView()
        } else {
            NavigationView {
                PresentationView()
            }
        }
    }
}

#Preview {
    ContentView()
}
