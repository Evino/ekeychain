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
    private let keychainIdentifier = "EKeychainManager_Identifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keychainManager = EKeychainManager(identifier: self.keychainIdentifier)
    }
    
    @IBAction func StoreButtonTapped(_ sender: UIButton) {
        
        if let _ = self.keychainManager?.getStoredToken() {
            print("You can't store a token because it already exist, maybe you should try update.")
        }
        else { self.storeTokenInKeychain() }
    }
    
    @IBAction func UpdateButtonTapped(_ sender: UIButton) {
        
        if let _ = self.keychainManager?.getStoredToken() {
            self.updateStoredToken()
        }
        else { self.storeTokenInKeychain() }
    }
    
    @IBAction func DeleteButtonTapped(_ sender: UIButton) {
        
        if let _ = self.keychainManager?.getStoredToken() {
            self.deleteStoredToken()
        }
        else { print("Token doesn't exist.") }
    }
    
    private func storeTokenInKeychain() {
        guard let token = TokenTextField.text else { return }
        guard let keychainAttributes = self.keychainManager?.generateAttributes(with: token) else { return }
        
        self.keychainManager?.storeToken(with: keychainAttributes, success: {
            print("token stored successfully - \(token)")
        }, fail: {
            print("fail to storage the token")
        })
    }
    
    private func updateStoredToken() {
        guard let token = TokenTextField.text else { return }
        guard let keychainAttributes = self.keychainManager?.generateAttributesToUpdate(with: token) else { return }
        
        self.keychainManager?.setStoredToken(with: keychainAttributes, success: {
            print("token updated successfully - \(token)")
        }, fail: {
            print("fail to update the token")
        })
    }
    
    private func deleteStoredToken() {
        
        self.keychainManager?.deleteStoredToken(success: {
            print("token deleted successfully")
        }, fail: {
            print("fail to delete the token")
        })
    }
}

