//
//  LoginController.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 21/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import CoreData

class LoginController {
    let dataManager = DataManager()
    
    func getArrayUser() -> [User] {
        loadData()
        return dataManager.arrayUsers
    }
    
    func getEmail(index: IndexPath) -> String{
        return getArrayUser()[index.row].email ?? ""
    }
    
    func getPassword(index: IndexPath) -> String{
        return getArrayUser()[index.row].password ?? ""
    }
    
    
    
    func loadData() {
        dataManager.loadData { (arrayUsers) in
            if let array = arrayUsers {
                 dataManager.arrayUsers = array
            }
        }
    }
    
    func logarUser(login: UITextField, password: UITextField, label: UILabel, completion: (NSManagedObject?) -> Void) {
        if Validacao.loginUser(login: login, senha: password, label: label) {
            for user in getArrayUser() {
                if user.email == login.text && user.password == password.text{
                    completion(user)
                }else if user.email == login.text && user.password != password.text {
                    label.text = "Wrong Password"
                    completion(nil)
                }
            }
            
            label.text = "Unregistered User"
            completion(nil)
        }
    }
    
    func registerUser(login: UITextField, password: UITextField, name: UITextField, birth: UITextField, warningLabel: UILabel, completion: (Bool) -> Void) {
        
        if Validacao.registerUser(name: name, login: login, password: password, birth: birth, label: warningLabel) {
            if dataManager.searchEmailExist(email: login.text!) {
                
                warningLabel.text = "User Already Exist"
                return
                
            }
            
            dataManager.registerUser(name: name.text!, password: password.text!, email: login.text!, birth: birth.text!) { (sucess) in
                if sucess {
                    loadData()
                    completion(true)
                }
            }
                
        }
        
        
    }
    
    func deleteUser(index: IndexPath){
        dataManager.deleteUser(id: getArrayUser()[index.row].objectID) { (success) in
            if success {
                self.loadData()
            }
        }
    }
    
    func isAdmin(email: String) -> Bool {
        if dataManager.checkAdmin(email: email) {
            return true
        }
        return false
    }
}

