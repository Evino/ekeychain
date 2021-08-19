//
//  EKeychainTests.swift
//  EKeychainManagerTests
//
//  Created by Lucas Soares on 28/07/21.
//

import XCTest
@testable import EKeychainManager

class EKeychainTests: XCTestCase {
    
    let keychainManager = EKeychainManager(identifier: "EKeychainTests_identifier")
    
    func testGetStoredTokenSuccess() {
        
        if let value = self.keychainManager.getStoredAttribute() {
            XCTAssertNotNil(value)
        }
        else {
            testStoreTokenSuccess()
            XCTAssertNotNil(self.keychainManager.getStoredAttribute())
        }
        
    }
    
    func testStoreTokenSuccess() {
        
        if let _ = self.keychainManager.getStoredAttribute() {
            testDeleteTokenSuccess()
        }
        
        keychainManager.storeAttribute(with: "TOKEN_123!@#-STORED", success: {
            XCTAssert(true)
        }, fail: {
            XCTAssert(false)
        })
    }
    
    func testUpdateTokenSuccess() {
        
        keychainManager.setStoredAttribute(with: "TOKEN_123!@#-UPDATED", success: {
            XCTAssert(true)
        }, fail: {
            XCTAssert(false)
        })
    }
    
    func testDeleteTokenSuccess() {
        
        if let _ = self.keychainManager.getStoredAttribute() {
            
            keychainManager.deleteStoredAttribute(success: {
                XCTAssert(true)
            }, fail: {
                XCTAssert(false)
            })
        }
    }

}
