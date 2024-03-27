//
//  ResetPasswordViewModel.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 20.02.2024.
//

import Foundation
import SwiftUI
import Combine

final class ResetPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var newPassword = ""
    @Published var isEmailValid = false
    @Published var isPasswordUpdated = false
    @Published var isLoading = false
    @Published var errorMessage: String?

    // Функция для отправки запроса на проверку электронной почты
    func verifyEmail() {
        isLoading = true
        errorMessage = nil
        
        // Код для отправки запроса к серверу на проверку email
        let verifyEmailURL = URL(string: "https://example.com/api/verifyEmail")!
        var request = URLRequest(url: verifyEmailURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = ["email": email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    self?.errorMessage = "Error: Invalid response from the server."
                    return
                }

                // Здесь предполагается, что сервер возвращает флаг, указывающий, существует ли email
                self?.isEmailValid = true
            }
        }
        task.resume()
    }

    // Функция для отправки нового пароля на сервер
    func resetPassword() {
        isLoading = true
        errorMessage = nil
        
        // Здесь должен быть код для отправки нового пароля на сервер
        let resetPasswordURL = URL(string: "https://example.com/api/resetPassword")!
        var request = URLRequest(url: resetPasswordURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = [
            "email": email,
            "password": newPassword
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.errorMessage = "Network error: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    self?.errorMessage = "Error: Invalid response from the server."
                    return
                }

                // Предполагается, что сервер возвращает успешный ответ после сброса пароля
                self?.isPasswordUpdated = true
            }
        }
        task.resume()
    }
}
