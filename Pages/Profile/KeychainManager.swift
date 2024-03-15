import KeychainSwift

class KeychainManager {
    static let shared = KeychainManager()
    private let keychain = KeychainSwift()
    private let tokenKey = "userToken"

    /// Сохраняет токен пользователя в Keychain.
    /// - Parameter token: Токен пользователя для сохранения.
    func saveUserToken(_ token: String) {
        keychain.set(token, forKey: tokenKey)
    }

    /// Извлекает токен пользователя из Keychain.
    /// - Returns: Токен пользователя, если он сохранен, иначе `nil`.
    func getUserToken() -> String? {
        return keychain.get(tokenKey)
    }

    /// Удаляет токен пользователя из Keychain.
    func deleteUserToken() {
        keychain.delete(tokenKey)
    }
}
