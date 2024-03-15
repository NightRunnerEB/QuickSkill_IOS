//
//  NetworkServiceWithAlamofire.swift
//  QuickSkill
//
//  Created by Евгений Бухарев on 15.03.2024.
//

import Alamofire
import Combine
import Foundation

class NetworkServiceWithAlamofire {
    static let shared = NetworkServiceWithAlamofire()
    
    private init() { }

    func fetchData<T: Decodable>(from urlString: String, token: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NSError(domain: "InvalidURL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }

        // Создаем URLRequest и настраиваем его
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Устанавливаем метод запроса
        request.setValue(token, forHTTPHeaderField: "Authorization") // Устанавливаем токен авторизации
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Устанавливаем заголовок Content-Type

        // Возвращаем публикатор, который выполняет запрос и декодирует ответ
        return AF.request(request)
            .publishData(emptyResponseCodes: Set([200, 204, 205])) // Указание этих кодов в emptyResponseCodes говорит публикатору, что отсутствие тела ответа при получении этих кодов статуса не должно рассматриваться как ошибка.
            .tryMap { response -> Data in
                guard let data = response.data else {
                    throw AFError.responseValidationFailed(reason: .dataFileNil)
                }
                return data
            }
            .decode(type: T.self, decoder: { 
                let decoder = JSONDecoder();
                decoder.keyDecodingStrategy = .convertFromSnakeCase;
                return decoder }())
            .eraseToAnyPublisher()
    }
    
    func postData<U: Encodable>(to urlString: String, token: String, requestData: U) -> AnyPublisher<Void, Error> {
        guard let url = URL(string: urlString) else {
            return Fail<Void, Error>(error: NSError(domain: "InvalidURL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }

        // Создаем URLRequest и настраиваем его для POST запроса
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(requestData)
            request.httpBody = jsonData
        } catch {
            return Fail<Void, Error>(error: error)
                .eraseToAnyPublisher()
        }

        // Используем Alamofire для отправки запроса и возвращаем результат в виде публикатора
        return AF.request(request)
            .publishData() // Создаем публикатор Combine
            .tryMap { response in
                // Проверяем HTTP статус код
                guard let httpResponse = response.response, httpResponse.statusCode == 200 else {
                    throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: response.response?.statusCode ?? 0))
                }
                // Возвращаем пустой результат в случае успеха
                return ()
            }
            .eraseToAnyPublisher()
    }
    
    func fetchAndPostData<T: Decodable, U: Encodable>(to urlString: String, token: String, requestData: U) -> AnyPublisher<T, Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NSError(domain: "InvalidURL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }

        // Создаем URLRequest и настраиваем его для POST запроса
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(requestData)
            request.httpBody = jsonData
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }

        // Используем Alamofire для выполнения запроса и возвращаем результат в виде публикатора
        return AF.request(request)
            .publishData()
            .tryMap { response in
                guard let data = response.data else {
                    throw AFError.responseValidationFailed(reason: .dataFileNil)
                }
                return data
            }
            .decode(type: T.self, decoder: {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return decoder
            }())
            .eraseToAnyPublisher()
    }
    
    func registerUser(registrationData: RegistrationData, to urlString: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }

        // Создаем URLRequest и настраиваем его для POST запроса
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(registrationData)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }

        // Выполняем запрос с использованием Alamofire
        AF.request(request).responseData { response in
            switch response.result {
            case .success:
                guard let httpResponse = response.response else {
                    completion(.failure(NSError(domain: "NoResponse", code: 0, userInfo: nil)))
                    return
                }
                
                // Проверяем наличие и извлекаем токен из Cookies
                if let headerFields = httpResponse.allHeaderFields as? [String: String],
                   let url = httpResponse.url,
                   let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url).first(where: { $0.name == "UserToken" }) {
                    // Сохраняем токен в Keychain
                    KeychainManager.shared.saveUserToken(cookies.value)
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "TokenError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Не удалось извлечь токен пользователя."])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loginUser(loginData: LoginData, to urlString: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }

        // Создаем URLRequest и настраиваем его для POST запроса
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(loginData)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }

        // Выполняем запрос с использованием Alamofire
        AF.request(request).responseData { response in
            switch response.result {
            case .success:
                guard let httpResponse = response.response else {
                    completion(.failure(NSError(domain: "NoResponse", code: 0, userInfo: nil)))
                    return
                }
                
                // Проверяем наличие и извлекаем токен из Cookies
                if let headerFields = httpResponse.allHeaderFields as? [String: String],
                   let url = httpResponse.url,
                   let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url).first(where: { $0.name == "UserToken" }) {
                    // Сохраняем токен в Keychain
                    KeychainManager.shared.saveUserToken(cookies.value)
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "TokenError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Не удалось извлечь токен пользователя."])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
