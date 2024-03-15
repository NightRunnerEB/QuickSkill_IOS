//
//  CourseView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 28.02.2024.
//

import SwiftUI

struct CourseView: View {
    
    let course: Course
    
    @EnvironmentObject var userVM: UserViewModel
    @State private var isExpandedDict: [UUID: Bool] = [:]
    @State private var isPresentedAllCourses = false
    
    private func binding(for id: UUID) -> Binding<Bool> {
        Binding(
            get: { self.isExpandedDict[id, default: false] },
            set: { self.isExpandedDict[id] = $0 }
        )
    }
    
    var body: some View {
        if !userVM.user.coursesSuccess.isEmpty {
            List {
                VStack {
                    HStack {
                        
                        Image("streak_ball")
                        Text("\(userVM.user.streak)")
                        
                        Spacer()
                        
                        Image("Crystall")
                        Text("\(userVM.user.crystalls)")
                        
                        Spacer()
                        
                        Image("Battery")
                        Text("\(userVM.user.energy)")
                        
                        Spacer()
                        
                        Button(action: {
                            isPresentedAllCourses = true
                        }, label: {
                            Image(course.icon)
                                .resizable()
                                .frame(width: 33, height: 33)
                                .fullScreenCover(isPresented: $isPresentedAllCourses, content: {
                                    AllCoursesView()
                                })
                        })
                        
                    }
                    .font(Font.Poppins(size: 22).weight(.semibold))
                    .padding()
                    
                    ProgressCircleView(tasksCount: /*course.lecturesAndPractices.count*/ 10, progress: userVM.user.coursesSuccess[course.id] ?? 0)
                        .frame(width: 100, height: 120)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                
                ForEach(course.lecturesAndPractices) { lesson in
                    Section {
                        DisclosureGroup(
                            isExpanded: binding(for: lesson.id),
                            content: {
                                VStack(alignment: .leading, spacing: 30) {
                                    HStack(alignment: .center, spacing: 8) {
                                        Image("Approved Unlock")
                                        
                                        VStack(alignment: .leading) {
                                            Text(lesson.lecture.title)
                                                .font(Font.Poppins(size: 17).weight(.semibold))
                                            
                                            Text(lesson.lecture.description)
                                                .font(Font.Poppins(size: 17)).opacity(0.35)
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    HStack(alignment: .center, spacing: 8) {
                                        Image("Approved Unlock")
                                        
                                        VStack(alignment: .leading) {
                                            Text(lesson.practice.title)
                                                .font(Font.Poppins(size: 17).weight(.semibold))
                                            
                                            Text(lesson.practice.description)
                                                .font(Font.Poppins(size: 17)).opacity(0.35)
                                        }
                                        Spacer()
                                    }
                                }
                                .frame(width: 380, height: 120)
                            },
                            label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 364, height: 50)
                                        .foregroundColor(.clear)
                                        .background(Color("Block"))
                                        .cornerRadius(24)
                                    
                                    HStack {
                                        Image("Ok_2")
                                            .padding(.leading, 8)
                                        
                                        Spacer()
                                        
                                        Text(lesson.lecture.title)
                                            .font(Font.Poppins(size: 15.74).weight(.bold))
                                        
                                        Spacer()
                                    }
                                }
                            }
                        )
                    }
                    .padding(.top, 20)
                }
                .listRowSeparator(.hidden)
                
                VStack(spacing: 8.40) {
                  VStack(spacing: 0) {
                    Image("Diploma")
                    Text("Certificate")
                      .font(Font.custom("Inter", size: 22).weight(.medium))
                  }
                  Text("Discover your perfect course with QuickSkill's personalized recommendation quiz – unlock your learning journey today! ")
                    .font(Font.custom("Inter", size: 15))
                    .lineSpacing(8)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.60))
                }
                .frame(width: 358, height: 199.61)
                .listRowSeparator(.hidden)
                
                HStack {
                    Spacer()
                    
                  Text("Subscribe")
                    .font(Font.Poppins(size: 20.66).weight(.medium))
                    .padding(
                      EdgeInsets(top: 13.66, leading: 21.01, bottom: 13.66, trailing: 21.01)
                    )
                    .foregroundColor(.white)
                    .background(Color(red: 1, green: 0.84, blue: 0))
                    .cornerRadius(10.51)
                    .listRowSeparator(.hidden)
                    
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .background(Color.white)
            
            
        } else {
            
        }
    }
}

#Preview {
    CourseView(course: Course.allCourses[0])
        .environmentObject(UserViewModel())
}
