//
//  DailyTasksView.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 29.02.2024.
//

import Foundation

struct DailyTask: Identifiable, Codable {
    var id = UUID()
    let icon: String
    let description: String
    let targetValue: Int
    var currentValue: Int = 0
    
    var isCompleted: Bool {
        currentValue >= targetValue
    }
}

extension DailyTask {
    static let task1 = DailyTask(icon: "Task_5", description: "Complete 2 lessons:", targetValue: 2)
    static let task2 = DailyTask(icon: "Task_10", description: "Complete 3 practices without mistakes:", targetValue: 3)
    static let task3 = DailyTask(icon: "Ok_1", description: "Open the app today", targetValue: 1)
}

extension DailyTask {
    static let allDailyTasks : [DailyTask] = [
        .task1,
        .task2,
        .task3
    ]
}
