//
//  ViewController.swift
//  EKeychainManagerSample
//
//  Created by Lucas Soares on 26/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TokenTextField: UITextField!
    
    var tokenKeychainManager = KeychainOptionManager(type: .token)
    var otherSampleKeychainManager = KeychainOptionManager(type: .otherSample)
    
    @IBAction func StoreButtonTapped(_ sender: UIButton) {
        
        guard let token = TokenTextField.text, token.count > 0 else { return }
        
        tokenKeychainManager.value = token
        otherSampleKeychainManager.value = "Outro texto qualquer para indicar valor"
    }
    
    @IBAction func UpdateButtonTapped(_ sender: UIButton) {
        
        guard let token = TokenTextField.text, token.count > 0 else { return }
        
        tokenKeychainManager.value = (token + "_Updated")
        otherSampleKeychainManager.value = (otherSampleKeychainManager.value + "_Updated")
    }
    
    @IBAction func DeleteButtonTapped(_ sender: UIButton) {
        
        tokenKeychainManager.value = ""
        otherSampleKeychainManager.value = ""
    }
    
}

