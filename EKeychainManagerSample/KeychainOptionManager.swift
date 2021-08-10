//
//  KeychainOption.swift
//  EKeychainManagerSample
//
//  Created by Lucas Soares on 09/08/21.
//

import EKeychainManager

final class KeychainOptionManager {
    
    let type: Options
    var value: String = "" {
        willSet {
            self.check(newValue)
        }
    }
    // Add how many and which options do you want in this enum
    enum Options: String {
        case token
        case otherSample
        
        func manager() -> EKeychainManager {
            return EKeychainManager(identifier: "EKeychainManager_Identifier_\(self.rawValue)")
        }
    }
    
    init(type: Options) {
        self.type = type
    }
}


// MARK: - Private methods

private extension KeychainOptionManager {
    
    func check(_ newValue: String) {
        
        let manager = type.manager()
        
        guard let oldValue = manager.getStoredAttribute() else {
            storeAttribute(at: manager, with: newValue)
            return
        }
        guard oldValue != newValue else { return }
        
        if newValue == "" {
            deleteStoredAttribute(at: manager)
        }
        else {
            updateStoredAttribute(at: manager, with: newValue)
        }
    }
    
    func storeAttribute(at manager: EKeychainManager, with value: String) {

        manager.storeAttribute(with: value, success: {
            print("\(self.type.rawValue) stored successfully - \(value)")
        }, fail: {
            print("fail to storage the \(self.type.rawValue)")
        })
    }

    func updateStoredAttribute(at manager: EKeychainManager, with value: String) {

        manager.setStoredAttribute(with: value, success: {
            print("\(self.type.rawValue) updated successfully - \(value)")
        }, fail: {
            print("fail to update the \(self.type.rawValue)")
        })
    }

    func deleteStoredAttribute(at manager: EKeychainManager) {

        manager.deleteStoredAttribute(success: {
            print("\(self.type.rawValue) deleted successfully")
        }, fail: {
            print("fail to delete the \(self.type.rawValue)")
        })
    }
}
