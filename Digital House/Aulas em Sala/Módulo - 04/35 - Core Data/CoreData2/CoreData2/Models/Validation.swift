//
//  Validation.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 20/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class Validacao {
    static func eEmailValido(testStr: String) -> Bool {
        return  NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: testStr)
    }
    
    static func loginUser (login: UITextField, senha: UITextField, label: UILabel) -> Bool{
        if login.hasText && senha.hasText {
            if Validacao.eEmailValido(testStr: login.text!) {
                return true
            }else {
                label.text = "Invalid Email"
                return false
            }
        }else if !login.hasText {
            label.text = "Email Missing"
            return false
        }else if !senha.hasText{
            label.text = "Password Missing"
            return false
        }
        return false
    }
    
    static func registerUser(name: UITextField, login: UITextField, password: UITextField, birth: UITextField, label: UILabel) -> Bool {
        if login.hasText && password.hasText && birth.hasText && name.hasText{
            if Validacao.eEmailValido(testStr: login.text!) {
                return true
            }else {
                label.text = "Invalid Email"
                return false
            }
        }else if !name.hasText {
            label.text = "Name Missing"
            return false
        }else if !login.hasText{
            label.text = "Email Missing"
            return false
        }else if !password.hasText{
            label.text = "Password Missing"
            return false
        }else if !birth.hasText{
            label.text = "Birth Missing"
            return false
        }
        return false
    }
    
}
