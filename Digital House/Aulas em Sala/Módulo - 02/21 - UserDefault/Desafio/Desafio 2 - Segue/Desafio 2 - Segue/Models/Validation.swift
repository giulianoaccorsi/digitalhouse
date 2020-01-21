//
//  Validation.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 18/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class Validacao {
    static func checkEmail(stringTest: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: stringTest)
    }
    
    static func loginValidation(login: UITextField, senha: UITextField, label: UILabel) -> Bool {
        if login.hasText && senha.hasText {
            if checkEmail(stringTest: login.text!) {
                return true
            }else {
                label.text = "Email Inválido"
            }
        }else if !login.hasText {
            label.text = "Login Incompleto"
        }else if !senha.hasText{
            label.text = "Senha Incompleta"
        }
        return false
    }
    
    static func registerValidation(login: UITextField, senha: UITextField, dataNasc: UITextField, label: UILabel) -> Bool {
        if login.hasText && senha.hasText && dataNasc.hasText {
            if checkEmail(stringTest: login.text!) {
            return true
            }else {
                label.text = "Email Inválido"
            }
        }else if !login.hasText {
            label.text = "Login Incompleto"
        }else if !senha.hasText {
            label.text = "Senha Incompleta"
        }else {
            label.text = "Data Nascimento Incompleto"
        }
        return false
    }
    
}
