//
//  LeagueModel.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 21.02.2024.
//

import Foundation
import SwiftUI

struct League: Identifiable {
    let id: Int
    let name: String
    let scoreRange: ClosedRange<Int> // Диапазон очков для участия
    var leagueImage: Image
}

extension League {
    static let solarSentinel = League(id: 0, name: "Solar Sentinel", scoreRange: 0...999, leagueImage: Image("Solar Sentinel"))
    static let aquaHorizon = League(id: 1, name: "Aqua Horizon", scoreRange: 1000...1999, leagueImage: Image("Aqua Horizon"))
    static let cyberShield = League(id: 2, name: "Cyber Shield", scoreRange: 2000...2999, leagueImage: Image("Cyber Shield"))
    static let digitalGuardian = League(id: 3, name: "Digital Guardian", scoreRange: 3000...3999, leagueImage: Image("Digital Guardian"))
    static let dataSentinel = League(id: 4, name: "Data Sentinel", scoreRange: 4000...4999, leagueImage: Image("Data Sentinel"))
    static let codeProtector = League(id: 5, name: "Code Protector", scoreRange: 5000...5999, leagueImage: Image("Code Protector"))
    static let quantumGuardian = League(id: 6, name: "Quantum Guardian", scoreRange: 6000...6999, leagueImage: Image("Quantum Guardian"))
    static let binarySentinel = League(id: 7, name: "Binary Sentinel", scoreRange: 7000...7999, leagueImage: Image("Binary Sentinel"))
    static let techDefender = League(id: 8, name: "Tech Defender", scoreRange: 8000...8999, leagueImage: Image("Tech Defender"))
}

extension League {
    static let leagues: [League] = [
        .solarSentinel,
        .aquaHorizon,
        .cyberShield,
        .digitalGuardian,
        .dataSentinel,
        .codeProtector,
        .quantumGuardian,
        .binarySentinel,
        .techDefender
    ]
}


