//
//  BadgeModel.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 27.02.2024.
//

import Foundation

struct Badge: Identifiable {
    var id: Int
    let name: String
    let description: String
    let icon: String
}

extension Badge {
    static let quickSkillVeteran = Badge(id: 1, name: "Quick Skill Veteran", description: "For successful service in the ranks of the Quick Skill digital troops", icon: "Badge1")
    static let practiceKiller = Badge(id: 2, name: "Practice killer💀", description: "Systematic and persistent training for 3 months in a row to improve your programming skills", icon: "Badge2")
    static let answerGuru = Badge(id: 3, name: "Answer guru👽", description: "Demonstrating a high level of knowledge and expertise in answering questions and tasks related to programming", icon: "Badge3")
    static let some4 = Badge(id: 4, name: "Quick Skill Veteran", description: "For successful service in the ranks of the Quick Skill digital troops", icon: "Badge1")
    static let some5 = Badge(id: 5, name: "Practice killer💀", description: "Systematic and persistent training for 3 months in a row to improve your programming skills", icon: "Badge2")
    static let some6 = Badge(id: 6, name: "Answer guru👽", description: "Demonstrating a high level of knowledge and expertise in answering questions and tasks related to programming", icon: "Badge3")
}

extension Badge {
    static let allBadges: [Badge] = [
        .quickSkillVeteran,
        .practiceKiller,
        .answerGuru,
        .some4,
        .some5,
        .some6
    ]
}
