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
    
    static func loginUser (login: String, senha: String, completion: (String, Bool) -> Void){
        if !login.isEmpty && !senha.isEmpty {
            if Validacao.eEmailValido(testStr: login) {
                completion("",true)
                return
            }else {
                completion("Invalid Email", false)
                return

            }
        }else if !login.isEmpty {
            completion("Email Missing", false)
            return
        }else if !senha.isEmpty{
            completion("Password Missing", false)
            return
        }
        completion("",false)
    }
    
    static func registerUser(name: String, login: String, password: String, birth: String, completion: (String,Bool) -> Void) {
        if !login.isEmpty && !password.isEmpty && !birth.isEmpty && !name.isEmpty{
            if Validacao.eEmailValido(testStr: login) {
                completion("",true)
                return
            }else {
                completion("Invalid Email", false)
                return
            }
        }else if !name.isEmpty {
            completion("Name Missing",false)
            return
        }else if !login.isEmpty{
            completion("Email Missing", false)
            return
        }else if !password.isEmpty{
            completion("Password Missing", false)
            return
        }else if !birth.isEmpty{
            completion("Birth Missing", false)
            return
        }
        completion("",false)
    }
    
}
