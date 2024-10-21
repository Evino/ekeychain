//
//  EKeychainManager.swift
//  EKeychainManager
//
//  Created by Lucas Soares on 26/07/21.
//

import Security
import Foundation

public final class EKeychainManager {
    
    private let identifier: String
    
    public init(identifier: String) {
        self.identifier = identifier
    }
    
}


// MARK: - Public methods

extension EKeychainManager {
    
    public func getStoredAttribute() -> String? {
        
        var item: CFTypeRef?

        // Check if content exists in the keychain
        if SecItemCopyMatching(generateQuery() as CFDictionary, &item) == noErr {
            // Extract the result
            if let existingItem = item as? [String: Any],
               let data = existingItem[kSecValueData as String] as? Data,
               let attribute = String(data: data, encoding: .utf8) {
                
                return attribute
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    public func storeAttribute(with value: String, success: @escaping () -> Void, fail: @escaping () -> Void) {
        
        let values = generateDictionaryToInsert(with: value)
        
        // Trying to add values
        if SecItemAdd(values as CFDictionary, nil) == noErr {
            success()
        } else {
            fail()
        }
    }
    
    public func setStoredAttribute(with value: String, success: @escaping () -> Void, fail: @escaping () -> Void) {

        let values = generateDictionaryToUpdate(with: value)
        
        // Find values and update
        if SecItemUpdate(generateQueryToUpdate() as CFDictionary, values as CFDictionary) == noErr {
            success()
        } else {
            fail()
        }
    }
    
    public func deleteStoredAttribute(success: @escaping () -> Void, fail: @escaping () -> Void) {
        
        // Find attribute and delete
        if SecItemDelete(generateQueryToUpdate() as CFDictionary) == noErr {
            success()
        } else {
            fail()
        }
    }
    
}


// MARK: - Private methods

private extension EKeychainManager {
    
    func generateQuery() -> [String: Any] {
        
        return [ kSecClass as String: kSecClassGenericPassword,
                 kSecAttrAccount as String: identifier,
                 kSecMatchLimit as String: kSecMatchLimitOne,
                 kSecReturnAttributes as String: true,
                 kSecReturnData as String: true ]
    }
    
    func generateQueryToUpdate() -> [String: Any] {
        
        return [ kSecClass as String: kSecClassGenericPassword,
                 kSecAttrAccount as String: identifier ]
    }
    
    func generateDictionaryToInsert(with attribute: String) -> [String: Any] {
        
        return [ kSecClass as String: kSecClassGenericPassword,
                 kSecAttrAccount as String: identifier,
                 kSecValueData as String: attribute.data(using: .utf8)! ]
    }
    
    func generateDictionaryToUpdate(with attribute: String) -> [String: Any] {
        
        return [ kSecValueData as String: attribute.data(using: .utf8)! ]
    }
    
}
