//
//  ViewController.swift
//  EKeychainManagerSample
//
//  Created by Lucas Soares on 26/07/21.
//

import UIKit
import EKeychainManager

class ViewController: UIViewController {

    @IBOutlet weak var TokenTextField: UITextField!
    
    private var keychainManager: EKeychainManager?
    private let keychainIdentifier = "identifier_\(UIDevice.current.identifierForVendor!.uuidString)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keychainManager = EKeychainManager(identifier: self.keychainIdentifier)
    }
    
    @IBAction func StoreButtonTapped(_ sender: UIButton) {
        self.checkIfTokenAlreadyExists()
    }
    
    private func checkIfTokenAlreadyExists() {
        
        self.keychainManager?.getStoredToken(success: {
            token in
            print("token already exist: (stored token) \(token)")
            print("let's try to set to the new value")
            self.setTheStoredTokenValue()
            
        }, fail: {
            self.storeTokenInKeychain()
        })
    }
    
    private func storeTokenInKeychain() {
        guard let token = TokenTextField.text else { return }
        guard let keychainAttributes = self.keychainManager?.generateAttributes(with: token) else { return }
        
        self.keychainManager?.storeToken(with: keychainAttributes, success: {
            print("token stored with success - \(token)")
        }, fail: {
            print("fail to storage the token")
        })
    }
    
    private func setTheStoredTokenValue() {
        guard let token = TokenTextField.text else { return }
        guard let keychainAttributes = self.keychainManager?.generateAttributesToUpdate(with: token) else { return }
        
        self.keychainManager?.setStoredToken(with: keychainAttributes, success: {
            print("token updated with success - \(token)")
        }, fail: {
            print("fail to update the token")
        })
    }
}

