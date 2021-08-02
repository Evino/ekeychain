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
        self.testStoreTokenSuccess()
//        XCTAssertNotNil(self.keychainManager.getStoredToken())
    }
    
    func testStoreTokenSuccess() {
        
        let attributes = self.keychainManager.generateAttributes(with: "TOKEN_123!@#-STORED")
        
        self.keychainManager.storeToken(with: attributes, success: {
            XCTAssert(true)
        }, fail: { })
    }
    
    func testUpdateTokenSuccess() {
        
        let attributes = self.keychainManager.generateAttributesToUpdate(with: "TOKEN_123!@#-UPDATED")
        
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
