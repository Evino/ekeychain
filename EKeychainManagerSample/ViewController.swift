//
//  ViewController.swift
//  EKeychainManagerSample
//
//  Created by Lucas Soares on 26/07/21.
//

import UIKit
import Security

class ViewController: UIViewController {

    @IBOutlet weak var UserTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    private let keychainIdentifier = "identifier_\(UIDevice.current.identifierForVendor!.uuidString)"
    
    @IBAction func StoreButtonTapped(_ sender: UIButton) {
        
//        if self.tryToGetStoredValuesFromKeychain() {
//            debugPrint("Valores encontrados no keychain")
//        }
//        else { self.tryToStoreValuesInKeychain() }
    }
}

