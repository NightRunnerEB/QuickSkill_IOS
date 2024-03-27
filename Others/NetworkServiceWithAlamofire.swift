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
    
    // Ленивая инициализация для 'session', чтобы использовать 'manager'
    lazy var session: Session = {
        let manager = ServerTrustManager(evaluators: ["localhost": DisabledTrustEvaluator()])
        return Session(serverTrustManager: manager)
    }()
    
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
        session.request(request).response { response in
            guard let statusCode = response.response?.statusCode else {
                completion(.failure(NSError(domain: "NoResponse", code: 0, userInfo: [NSLocalizedDescriptionKey: "Ответ от сервера не получен."])))
                return
            }
            
            switch statusCode {
            case 200:
                // Запрос успешно обработан
                completion(.success(()))
            case 400:
                // Неправильное тело запроса
                completion(.failure(NSError(domain: "BadRequest", code: 400, userInfo: [NSLocalizedDescriptionKey: "Неправильное тело запроса."])))
            case 409:
                // Ошибка на сервере
                completion(.failure(NSError(domain: "ServerError", code: 409, userInfo: [NSLocalizedDescriptionKey: "Ошибка на сервере."])))
            default:
                // Обработка других кодов состояния
                completion(.failure(NSError(domain: "UnexpectedResponse", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Неожиданный ответ от сервера с кодом \(statusCode)."])))
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
        session.request(request).response { response in
            switch response.result {
            case .success:
                guard let httpResponse = response.response else {
                    completion(.failure(NSError(domain: "NoResponse", code: 0, userInfo: nil)))
                    return
                }
                
                // Извлекаем cookies из заголовков ответа
                if let headerFields = httpResponse.allHeaderFields as? [String: String], let url = httpResponse.url {
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url)
                    
                    // Ищем нужный cookie
                    if let userTokenCookie = cookies.first {
                        // Сохраняем значение токена в Keychain
                        print("Найден токен: \(userTokenCookie.value)")
                        KeychainManager.shared.saveUserToken(userTokenCookie.value)
                        completion(.success(()))
                    } else {
                        // Ошибка: cookie с токеном не найден
                        completion(.failure(NSError(domain: "TokenError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Токен пользователя не найден в cookies."])))
                    }
                } else {
                    // Ошибка: не удалось извлечь cookies
                    completion(.failure(NSError(domain: "CookieError", code: -3, userInfo: [NSLocalizedDescriptionKey: "Не удалось извлечь cookies из ответа."])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
