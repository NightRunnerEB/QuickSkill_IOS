//
//  UserLogInViewModel.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 20.02.2024.
//


import SwiftUI
import Foundation
import Combine

// ViewModel для аутентификации
class UserLogInViewModel: ObservableObject {
    @AppStorage("isUserAuthenticated") var isUserAuthenticated: Bool = false
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    // Функция для входа пользователя
    func login() {
        isLoading = true
        errorMessage = nil
        
        // Шаблон
        let url = URL(string: "https://example.com/api/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = [
            "email": userEmail,
            "password": userPassword
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

                guard let data = data,
                      let responseDict = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let userExists = responseDict["userExists"] as? Bool else {
                    self?.errorMessage = "Invalid data received from the server"
                    return
                }

                if userExists {
                    self?.isUserAuthenticated = true
                } else {
                    // Аутентификация не удалась
                    self?.errorMessage = "User does not exist or password is incorrect"
                }
            }
        }
        task.resume()
    }
}
