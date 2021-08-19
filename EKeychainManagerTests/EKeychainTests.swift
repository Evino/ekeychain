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
                
        wait(seconds: 1) {
            self.testStoreTokenSuccess()
            XCTAssertNotNil(self.keychainManager.getStoredAttribute())
        }
    }
    
    func testStoreTokenSuccess() {
        
        wait(seconds: 1) {
            self.keychainManager.storeAttribute(with: "TOKEN_123!@#-STORED", success: {
                XCTAssert(true)
            }, fail: {
                XCTAssert(false)
            })
        }
    }
    
    func testUpdateTokenSuccess() {
        
        wait(seconds: 1) {
            self.keychainManager.setStoredAttribute(with: "TOKEN_123!@#-UPDATED", success: {
                XCTAssert(true)
            }, fail: {
                XCTAssert(false)
            })
        }
    }
    
    func testDeleteTokenSuccess() {
        
        wait(seconds: 1) {
            self.keychainManager.deleteStoredAttribute(success: {
                XCTAssert(true)
            }, fail: {
                XCTAssert(false)
            })
        }
    }

}


private extension EKeychainTests {
    
    func wait(seconds: Double, completion: @escaping () -> Void) {
            
        let time = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            completion()
        }
    }
    
    func now(completion: @escaping () -> Void) {
    
        DispatchQueue.main.async {
            
            completion()
        }
    }
}
