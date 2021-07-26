//
//  EKeychainManager.swift
//  EKeychainManager
//
//  Created by Lucas Soares on 26/07/21.
//

import Security

public final class EKeychainManager {
    
    private let keychainIdentifier: String
    
    public init(identifier: String) {
        self.keychainIdentifier = identifier
    }
    
    public func storeToken(with values: [String: Any], success: @escaping () -> Void, fail: @escaping () -> Void) {
        
        // Trying to add values
        if SecItemAdd(values as CFDictionary, nil) == noErr {
            success()
        }
        else { fail() }
    }
    
    public func getStoredToken(success: @escaping(_ token: String) -> Void, fail: @escaping () -> Void) {
        
        var item: CFTypeRef?

        // Check if content exists in the keychain
        if SecItemCopyMatching(self.generateQuery() as CFDictionary, &item) == noErr {
            // Extract the result
            if let existingItem = item as? [String: Any],
               let data = existingItem[kSecValueData as String] as? Data,
               let token = String(data: data, encoding: .utf8) {
                
                success(token)
            }
            else { fail() }
        }
        else { fail() }
    }
    
    public func setStoredToken(with values: [String: Any], success: @escaping () -> Void, fail: @escaping () -> Void) {

        // Find values and update
        if SecItemUpdate(self.generateQueryToUpdate() as CFDictionary, values as CFDictionary) == noErr {
            success()
        }
        else { fail() }
    }
    
    public func generateAttributes(with token: String) -> [String: Any] {
        
        return [ kSecClass as String: kSecClassGenericPassword,
                 kSecAttrAccount as String: self.keychainIdentifier,
                 kSecValueData as String: token.data(using: .utf8)! ]
    }
    
    public func generateAttributesToUpdate(with token: String) -> [String: Any] {
        
        return [ kSecValueData as String: token.data(using: .utf8)! ]
    }
}


// MARK: - Private methods

extension EKeychainManager {
    
    private func generateQuery() -> [String: Any] {
        
        return [ kSecClass as String: kSecClassGenericPassword,
                 kSecAttrAccount as String: self.keychainIdentifier,
                 kSecMatchLimit as String: kSecMatchLimitOne,
                 kSecReturnAttributes as String: true,
                 kSecReturnData as String: true ]
    }
    
    private func generateQueryToUpdate() -> [String: Any] {
        
        return [ kSecClass as String: kSecClassGenericPassword,
                 kSecAttrAccount as String: self.keychainIdentifier ]
    }
}
