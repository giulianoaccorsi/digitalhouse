//
//  ViewController.swift
//  15 - UITextField
//
//  Created by Giuliano Accorsi on 11/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    @IBAction func teste(_ sender: Any) {
        emailTextField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(self.emailTextField) {
            self.passwordTextField.becomeFirstResponder()
            
        }else {
            self.passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .red
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .green
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Começou a editar")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Terminou de digitar")
        return true
    }
    


}

