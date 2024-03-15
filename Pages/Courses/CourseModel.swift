//
//  CourseModel.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 27.02.2024.
//

import Foundation

// Модель для курса
struct Course: Identifiable, Codable {
    var id: Int
    var lecturesAndPractices: [LectureAndPractice]
    var icon: String
    var title: String
    var durationMonth: Int
    var description: String
    var difficultyLevel: Int
    var type: CourseType.RawValue
}

// Вспомогательная структура для пар лекций и практик
struct LectureAndPractice: Identifiable, Codable {
    var id = UUID()
    var lecture: Lecture
    var practice: Practice
}

enum CourseType: String {
    case programmingLang = "Programming language"
    case engineering = "Engineering"
}

extension Course {
    //Примеры
    static let comment = Comment(description: "Very informative lecture.", authorLogin: "user123", likes: 5)
    static let task1 = Task(questionDescription: "What is polymorphism?", answerOptions: ["Inheritance", "Encapsulation", "Multiple forms"], correctAnswerIndex: 2)
    static let task2 = Task(questionDescription: "What is polymorphism?", answerOptions: ["Inheritance", "Encapsulation", "Multiple forms"], correctAnswerIndex: 2)
    static let task3 = Task(questionDescription: "What is polymorphism?", answerOptions: ["Inheritance", "Encapsulation", "Multiple forms"], correctAnswerIndex: 2)
    static let lecture1 = Lecture(videoUrl: URL(string: "https://example.com/lecture.mp4")!, title: "Basic data types", description: "This lecture covers the basics of C#.", comments: [comment])
    static let lecture2 = Lecture(videoUrl: URL(string: "https://example.com/lecture.mp4")!, title: "Working with strings", description: "This lecture covers the basics of C#.", comments: [comment])
    static let lecture3 = Lecture(videoUrl: URL(string: "https://example.com/lecture.mp4")!, title: "Basic data structures and sorting", description: "This lecture covers the basics of C#.", comments: [comment])
    static let practice = Practice(title: "Basic C# Practice", description: "Fucking great course & we need money", tasks: [task1, task2, task3], numberOfCorrectAnswers: 0)
    
    static let introductionCsharp = Course(id: 0,
                                           lecturesAndPractices: [LectureAndPractice(lecture: lecture1, practice: practice), LectureAndPractice(lecture: lecture2, practice: practice), LectureAndPractice(lecture: lecture3, practice: practice)],
                                           icon: "C#_icon",
                                           title: "C# Introduction",
                                           durationMonth: 2,
                                           description: "This course introduces the basics of C# programming.",
                                           difficultyLevel: 1,
                                           type: CourseType.programmingLang.rawValue
    )
    
    static let introductionCplus = Course(id: 1,
                                          lecturesAndPractices: [LectureAndPractice(lecture: lecture1, practice: practice), LectureAndPractice(lecture: lecture1, practice: practice), LectureAndPractice(lecture: lecture1, practice: practice)],
                                          icon: "C++_icon",
                                          title: "C++ Introduction",
                                          durationMonth: 1,
                                          description: "This course introduces the basics of C++ programming.",
                                          difficultyLevel: 1,
                                          type: CourseType.programmingLang.rawValue
    )
    
    static let intermediatePython = Course(id: 2,
                                           lecturesAndPractices: [LectureAndPractice(lecture: lecture1, practice: practice), LectureAndPractice(lecture: lecture1, practice: practice), LectureAndPractice(lecture: lecture1, practice: practice)],
                                           icon: "C++_icon",
                                           title: "Python Intermediate",
                                           durationMonth: 1,
                                           description: "The Python Intermediate course is designed for students already familiar with the basics of Python who want to deepen their knowledge and skills in programming in this language.",
                                           difficultyLevel: 1,
                                           type: CourseType.programmingLang.rawValue
    )
}

extension Course {
    static let allCourses: [Course] = [
        .introductionCsharp,
        .introductionCplus,
        .intermediatePython
    ]
}
