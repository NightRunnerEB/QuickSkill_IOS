//
//  CertificateModel.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 29.02.2024.
//

import Foundation

struct Certificate: Identifiable, Codable {
    var id: Int
    var icon: String // Сюда можно поместить имя системной иконки или имя файла изображения.
    var title: String
}

extension Certificate {
    static let CsharpBeginner = Certificate(id: 1, icon: "C#_icon", title: "C# Beginner")
    static let CsharpIntermediate = Certificate(id: 2, icon: "C#_icon", title: "C# Intermediate")
    static let CplusBeginner = Certificate(id: 3, icon: "C++_icon", title: "C++ Beginner")
    static let CplusIntermediate = Certificate(id: 4, icon: "C++_icon", title: "C++ Intermediate")
}

extension Certificate {
    static let allCertificates: [Certificate] = [
        .CplusBeginner,
        .CsharpBeginner,
        .CplusIntermediate,
        .CsharpIntermediate
    ]
}
