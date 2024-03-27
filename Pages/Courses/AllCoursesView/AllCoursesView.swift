//
//  AllCoursesView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 27.02.2024.
//

import SwiftUI
import PartialSheet

struct AllCoursesView: View {
    let courses = Course.allCourses
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    var filteredCourses: [Course] {
        if searchText.isEmpty {
            return courses
        } else {
            return courses.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(Image(systemName: "chevron.left"))
                            .frame(width: 20, height: 20)
                        Text("Back")
                            .font(Font.Poppins(size: 16))
                            .foregroundColor(Color("Purple"))
                    }
                    .frame(width: 60, height: 20)
                })
                .padding(.leading, 10)
                
                Spacer()
            }
            
            CustomSearchBarView()
                .padding(.top, 10)
            
                ScrollView {
                    LazyVStack {
                        ForEach(filteredCourses) { course in
                            CourseItemView(course: course)
                                .padding(.bottom, 10)
                            
                            Rectangle()
                                .foregroundColor(.gray)
                                .opacity(0.2)
                                .frame(width: 330, height: 1)
                                .padding(.bottom, 10)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .attachPartialSheetToRoot()
    }
}

#Preview {
    AllCoursesView()
}
