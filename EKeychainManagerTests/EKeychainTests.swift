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
        testStoreTokenSuccess()
//        XCTAssertNotNil(keychainManager.getStoredAttribute())
    }
    
    func testStoreTokenSuccess() {
        
        keychainManager.storeAttribute(with: "TOKEN_123!@#-STORED", success: {
            XCTAssert(true)
        }, fail: { })
    }
    
    func testUpdateTokenSuccess() {
        
        keychainManager.setStoredAttribute(with: "TOKEN_123!@#-UPDATED", success: {
            XCTAssert(true)
        }, fail: { })
    }
    
    func testDeleteTokenSuccess() {
        
        keychainManager.deleteStoredAttribute(success: {
            XCTAssert(true)
        }, fail: { })
    }

}
