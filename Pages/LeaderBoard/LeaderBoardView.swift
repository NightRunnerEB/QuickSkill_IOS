//
//  LeaderBoardView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 20.02.2024.
//

import SwiftUI

struct LeaderBoardView: View {
    
    enum RatingType {
        case weekly, friends
    }
    
    @State private var selectedRating: RatingType = .weekly
    
    @EnvironmentObject var userVM: UserViewModel
    var currentLeagueId: Int
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            SnapCarousel(trailingSpace: 270, target: currentIndex, index: $currentIndex, items: League.leagues) { league in

                VStack {
                    league.leagueImage
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(league.name)
                        .font(Font.custom("Poppins", size: 12).weight(.semibold))
                }
                
            }
            .frame(height: 150)
            
            Spacer()
                .frame(height: 50)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Weekly rating")
                        .fontWeight(selectedRating == .weekly ? .bold : .regular)
                        .onTapGesture {
                            withAnimation {
                                selectedRating = .weekly
                            }
                        }
                    
                    Spacer(minLength: 20)
                    
                    Text("Friends rating")
                        .fontWeight(selectedRating == .friends ? .bold : .regular)
                        .onTapGesture {
                            withAnimation {
                                selectedRating = .friends
                            }
                        }
                }
                
                // Полоса подчеркивания
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / 3, height: 2)
                    .foregroundColor(.black)
                    .animation(.default, value: selectedRating)
                    .offset(x: selectedRating == .weekly ? -10 : getRect().width / 2 - 17)
            }
            .frame(width: getRect().width / 1.3)
            
            if selectedRating == .weekly {
                
                List {
                    Section {
                        // Первые 5 пользователей
                        ForEach(0..<5) { index in
                            VStack(spacing: 0) {
                                LeaderboardRow(user: userVM.user.ratingLeague[index], rank: index)
                                
                                if index != 4 {
                                    Divider()
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 2))
                    }
                    .listRowSeparator(.hidden)
                    
                    Image("Chevron_green")
                    
                    Section {
                        // Следующие 10 пользователей
                        ForEach(5..<15) { index in
                            VStack(spacing: 0) {
                                LeaderboardRow(user: userVM.user.ratingLeague[index])
                                
                                if index != 14 {
                                    Divider()
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 2))
                    }
                    .listRowSeparator(.hidden)
                    
                    Image("Chevron_red")
                    
                    Section {
                        // Оставшиеся 5 пользователей
                        ForEach(15..<20) { index in
                            VStack(spacing: 0) {
                                LeaderboardRow(user: userVM.user.ratingLeague[index])
                                
                                if index != 19 {
                                    Divider()
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 2))
                    }
                    .listRowSeparator(.hidden)
                }
                
            } else {
                if(userVM.user.following.isEmpty) {
                    Text("It looks like you're currently flying solo.\nAdd friends to make learning more enjoyable!")
                        .font(Font.custom("Poppins", size: 17))
                } else {
                    List {
                        Section {
                            ForEach(0..<userVM.user.following.count, id: \.self) { index in
                                VStack(spacing: 0) {
                                    LeaderboardFriendRow(user: userVM.user.following[index])
                                    
                                    if index != userVM.user.following.count - 1 {
                                        Divider()
                                            .padding(.leading, 10)
                                            .padding(.trailing, 10)
                                    }
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 2))
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            
        }
        .onAppear(perform: {
            currentIndex = userVM.user.experience / 1000
        })
    }
}

#Preview {
    @StateObject var userVM = UserViewModel()
    return LeaderBoardView(currentLeagueId: userVM.user.experience / 1000)
        .environmentObject(userVM)
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
