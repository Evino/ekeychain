//
//  EKeychainTests.swift
//  EKeychainManagerTests
//
//  Created by Lucas Soares on 28/07/21.
//

import XCTest
@testable import EKeychainManager

class EKeychainTests: XCTestCase {
    
    let keychainManager = EKeychainManager(identifier: "identifier_\(UIDevice.current.identifierForVendor!.uuidString)")
    
    func testGetStoredTokenSuccess() {
        self.testStoreTokenSuccess()
        self.keychainManager.getStoredToken(success: { token in
            XCTAssertNotNil(token)
        }, fail: { })
    }
    
    func testStoreTokenSuccess() {
        
        let attributes = self.keychainManager.generateAttributes(with: "TOKEN_123!@#-")
        
        self.keychainManager.storeToken(with: attributes, success: {
            XCTAssert(true)
        }, fail: { })
    }
    
    func testUpdateTokenSuccess() {
        
        let attributes = self.keychainManager.generateAttributesToUpdate(with: "TOKEN_123!@#-")
        
        self.keychainManager.setStoredToken(with: attributes, success: {
            XCTAssert(true)
        }, fail: { })
    }
    
    func testDeleteTokenSuccess() {
        
        self.keychainManager.deleteStoredToken(success: {
            XCTAssert(true)
        }, fail: { })
    }

}
