//
//  ShopView.swift
//  QuickSkill
//
//  Created by Али Сейфельдин on 26.02.2024.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView {
            
            VStack {
                
                Spacer(minLength: 40)
                
                HStack {
                    Text("Shop🛒")
                        .font(Font.Poppins(size: 30).weight(.medium))
                        .padding(.leading, 22)
                    
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    
                    //MARK: My inventory
                    VStack {
                        HStack {
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 83, height: 1.3)
                            
                            Text("My inventory ")
                                .font(Font.Poppins(size: 20.82).weight(.medium))
                            
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 83, height: 1.3)
                        }
                        
                        HStack(spacing: 12) {
                            
                            //MARK: Heard Card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 7.81)
                                                .inset(by: 0.52)
                                                .stroke(Color("Purple"), lineWidth: 1.3)
                                            
                                            
                                            VStack(spacing: 4) {
                                                Spacer()
                                                Text("❤️")
                                                    .font(.system(size: 53))
                                                    .frame(width: 59.57, height: 59.57)
                                                
                                                
                                                Text("Hearts")
                                                    .font(Font.Poppins(size: 13.20).weight(.medium))
                                                
                                                Image("Dotted_line")
                                                
                                                HStack(spacing: -3) {
                                                    Text("x3")
                                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                                        .foregroundStyle(Color("Purple"))
                                                    
                                                    Rectangle()
                                                        .foregroundColor(.black)
                                                        .frame(width: 16.26, height: 0.57)
                                                        .rotationEffect(.degrees(-90))
                                                    
                                                    Text("+1 in 04:32")
                                                        .font(Font.Poppins(size: 10.41))
                                                }
                                            }
                                            
                                        }
                                    )
                            }
                            
                            //MARK: Crystalls card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 7.81)
                                                .inset(by: 0.52)
                                                .stroke(Color("Purple"), lineWidth: 1.3)
                                            
                                            VStack(spacing: 4) {
                                                Spacer()
                                                
                                                Image("Crystall")
                                                    .resizable()
                                                    .frame(width: 40, height: 59.57)

                                                Text("Crystalls")
                                                    .font(Font.Poppins(size: 13.20).weight(.medium))
                                                
                                                Image("Dotted_line")
                                                
                                                Text("x78")
                                                    .font(Font.Poppins(size: 16.50).weight(.medium))
                                                    .foregroundStyle(Color("Purple"))
                                            }
                                        }
                                    )
                            }
                            
                            //MARK: StreakSaver card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 7.81)
                                                .inset(by: 0.52)
                                                .stroke(Color("Purple"), lineWidth: 1.3)
                                            
                                            
                                            VStack(spacing: 4) {
                                                Spacer()
                                                
                                                Image("Streak_saver")
                                                    .resizable()
                                                    .frame(width: 59.57, height: 59.57)
                                            
                                                Text("Streak saver")
                                                    .font(Font.Poppins(size: 13.20).weight(.medium))
                                                
                                                Image("Dotted_line")
                                                
                                                Text("x5")
                                                    .font(Font.Poppins(size: 16.50).weight(.medium))
                                                    .foregroundStyle(Color("Purple"))
                                            }
                                        }
                                    )
                            }
                        }
                    }
                    
                    //MARK: For PRO Only
                    VStack(spacing: 10) {
                        HStack {
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                            HStack(spacing: 8) {
                                Text("For")
                                Text("PRO")
                                    .foregroundStyle(Color("Purple"))
                                Text("only")
                            }
                            .font(Font.Poppins(size: 20.82).weight(.medium))
                            
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                        }
                        
                        ProLinkStringView()
                        
                        HStack(spacing: 20) {
                            
                            //MARK: UnlimitedHearts card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack {
                                    
                                    ZStack {
                                        Text("❤️‍🔥")
                                            .font(.system(size: 53))
                                        Text("∞")
                                    }
                                    
                                    Text("Unlimited")
                                        .font(Font.Poppins(size: 13.20).weight(.medium))
                                        .foregroundStyle(LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    
                                    Image("Dotted_line")
                                    
                                    ZStack() {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 74.95, height: 14.57)
                                            .background(Color(red: 1, green: 0.84, blue: 0))
                                            .cornerRadius(4.75)
                                        HStack(spacing: 4) {
                                            
                                            Text("Try")
                                            
                                            Text("PRO")
                                                .foregroundStyle(Color("Purple"))
                                            
                                        }
                                        .font(Font.custom("Poppins", size: 10.41).weight(.semibold))
                                    }
                                }
                            }
                            
                            //MARK: UnlimitedStreakSaver card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack {
                                    
                                    Text("🐳")
                                        .font(.system(size: 53))
                                    
                                    
                                    Text("smth else?")
                                        .font(Font.Poppins(size: 13.20).weight(.medium))
                                        .foregroundStyle(LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    
                                    Image("Dotted_line")
                                    
                                    ZStack() {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 74.95, height: 14.57)
                                            .background(Color(red: 1, green: 0.84, blue: 0))
                                            .cornerRadius(4.75)
                                        HStack(spacing: 4) {
                                            
                                            Text("Try")
                                            
                                            Text("PRO")
                                                .foregroundStyle(Color("Purple"))
                                            
                                        }
                                        .font(Font.custom("Poppins", size: 10.41).weight(.semibold))
                                    }
                                }
                            }
                        }
                    }
                    
                    //MARK: Hearts
                    VStack(spacing: 10) {
                        HStack {
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                            
                            Text("Hearts")
                                .font(Font.Poppins(size: 20.82).weight(.medium))
                            
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                        }
                        
                        Text("No hearts - no learning")
                            .font(Font.Poppins(size: 12).weight(.light))
                        
                        HStack(spacing: 12) {
                            
                            //MARK: One heart card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    Text("❤️")
                                        .font(Font.Poppins(size: 41.05))
                                        .padding(.top, 10)
                                    
                                    Text("x1")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    HStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 11, height: 18)
                                        
                                        Text("500")
                                            .font(Font.Poppins(size: 15.01).weight(.medium))
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                            
                            //MARK: Two hearts card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    ZStack {
                                        Text("❤️")
                                            .font(Font.Poppins(size: 41.05))
                                        
                                        Text("❤️")
                                            .font(Font.Poppins(size: 27))
                                            .offset(x: 13, y: 10)
                                    }
                                    .padding(.top, 10)
                                    
                                    Text("x2")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    HStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 11, height: 18)
                                        
                                        Text("750")
                                            .font(Font.Poppins(size: 15.01).weight(.medium))
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                            
                            //MARK: Multihearts card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    ZStack {
                                        Text("❤️")
                                            .font(Font.Poppins(size: 41.05))
                                        
                                        Text("❤️")
                                            .font(Font.Poppins(size: 29))
                                            .offset(x: 16, y: 6)
                                        
                                        Text("❤️")
                                            .font(Font.Poppins(size: 27))
                                            .offset(x: -15, y: 9)
                                    }
                                    .padding(.top, 10)
                                    
                                    Text("x5")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    HStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 11, height: 18)
                                        
                                        Text("2000")
                                            .font(Font.Poppins(size: 15.01).weight(.medium))
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                        }
                    }
                    
                    //MARK: Streak saver
                    VStack(spacing: 10) {
                        HStack {
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                            
                            Text("Streak saver")
                                .font(Font.Poppins(size: 20.82).weight(.medium))
                            
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                        }
                        
                        Text("Save your streak, even if you can't study today")
                            .font(Font.Poppins(size: 12).weight(.light))
                        
                        HStack(spacing: 12) {
                            
                            //MARK: Streak saver card one
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    ZStack {
                                        Image("Streak_saver")
                                            .resizable()
                                            .frame(width: 27.22, height: 24.74)
                                            .offset(x: -12, y: 10)
                                        
                                        Image("Streak_saver")
                                            .resizable()
                                            .frame(width: 27.22, height: 24.74)
                                            .offset(x: 0, y: -7)
                                        
                                        Image("Streak_saver")
                                            .resizable()
                                            .frame(width: 27.22, height: 24.74)
                                            .offset(x: 12, y: 10)
                                    }
                                    .frame(width: 54.57, height: 54.57)
                                    .padding(.top, 10)
                                    
                                    Text("x3")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    HStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 11, height: 18)
                                        
                                        Text("500")
                                            .font(Font.custom("Poppins", size: 15.01).weight(.medium))
                                    }
                                    .padding(.bottom, 4)
                                }
                            }
                            
                            //MARK: Streak saver card two
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    Image("Streak_saver")
                                        .resizable()
                                        .frame(width: 54.57, height: 54.57)
                                        .padding(.top, 10)
                                    
                                    Text("x5")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    HStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 11, height: 18)
                                        
                                        Text("700")
                                            .font(Font.custom("Poppins", size: 15.01).weight(.medium))
                                    }
                                    .padding(.bottom, 4)
                                }
                            }
                            
                            //MARK: Streak saver card three
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    Image("Streak_saver")
                                        .resizable()
                                        .frame(width: 54.57, height: 54.57)
                                        .padding(.top, 10)
                                    
                                    Text("x10")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    HStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 11, height: 18)
                                        
                                        Text("1000")
                                            .font(Font.custom("Poppins", size: 15.01).weight(.medium))
                                    }
                                    .padding(.bottom, 4)
                                }
                            }
                        }
                    }
                    
                    //MARK: More Crystalls
                    VStack(spacing: 10) {
                        HStack {
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                            
                            Text("More crystalls")
                                .font(Font.Poppins(size: 20.82).weight(.medium))
                            
                            Rectangle()
                                .foregroundColor(Color("Purple"))
                                .frame(width: 85, height: 1.3)
                        }
                        
                        Text("Unleash your patential with crystalls")
                            .font(Font.Poppins(size: 12).weight(.light))
                        
                        HStack(spacing: 12) {
                            
                            //MARK: Crystalls card one
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    
                                    Image("Crystall")
                                        .resizable()
                                        .frame(width: 30.57, height: 47.57)
                                        .frame(width: 54.57, height: 54.57)
                                        .padding(.top, 10)
                                    
                                    Text("x100")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    
                                    
                                    Text("4.99$")
                                        .font(Font.Poppins(size: 15.01).weight(.medium))
                                    
                                }
                            }
                            
                            //MARK: Crystalls card two
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    ZStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 20.57, height: 30.57)
                                            .offset(x: -15, y: 5)
                                        
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 25.57, height: 38.57)
                                            .offset(x: 0, y: -7)
                                        
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 20.57, height: 30.57)
                                            .offset(x: 15, y: 5)
                                    }
                                    .frame(width: 54.57, height: 54.57)
                                    .padding(.top, 10)
                                    
                                    Text("x500")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    Text("19.99$")
                                        .font(Font.Poppins(size: 15.01).weight(.medium))
                                    
                                }
                            }
                            
                            //MARK: Crystalls card three
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 112.95, height: 125.96)
                                    .background(Color.white)
                                    .cornerRadius(7.81)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 7.81)
                                            .inset(by: 0.52)
                                            .stroke(Color("Purple"), lineWidth: 1.3)
                                    )
                                
                                VStack(spacing: 4) {
                                    ZStack {
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 20.57, height: 30.57)
                                            .offset(x: -20, y: -13)
                                        
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 20.57, height: 30.57)
                                            .offset(x: -23, y: 14)
                                        
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 35.57, height: 55.57)
                                        
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 20.57, height: 30.57)
                                            .offset(x: 20, y: -13)
                                        
                                        Image("Crystall")
                                            .resizable()
                                            .frame(width: 20.57, height: 30.57)
                                            .offset(x: 23, y: 14)
                                    }
                                    .frame(width: 54.57, height: 54.57)
                                    .padding(.top, 10)
                                    
                                    Text("x1000")
                                        .font(Font.Poppins(size: 16.50).weight(.medium))
                                        .foregroundStyle(Color("Purple"))
                                    
                                    Image("Dotted_line")
                                    
                                    Text("35.99$")
                                        .font(Font.custom("Poppins", size: 15.01).weight(.medium))
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ShopView()
}
