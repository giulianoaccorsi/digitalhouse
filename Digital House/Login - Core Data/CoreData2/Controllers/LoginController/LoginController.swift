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
    
    func setUser(user: User) {
        dataManager.user = user
    }
    
    func getUser() -> User {
        if let userObtido = dataManager.user {
            return userObtido
        }
        return User()
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
    
    func logarUser(login: String, password: String, completion: (Bool,String) -> Void) {
        
        Validacao.loginUser(login: login, senha: password, completion: { (mensagem, success) in
            if success {
                dataManager.searchUser(email: login, password: password, completion: { (user, success, message) in
                    if success {
                        dataManager.user = user
                        completion(true,"")
                    } else {
                        completion(false, message)
                    }
                })
            }else {
                completion(false, mensagem)
            }
        })
    }
    
    func registerUser(login: String, password: String, name: String, birth: String, completion: (String,Bool) -> Void) {
        
        Validacao.registerUser(name: name, login: login, password: password, birth: birth) { (mensagem, success) in
            if dataManager.searchEmailExist(email: login) {
                completion("User Already Exist", true)
            }else {
                dataManager.registerUser(name: name, password: password, email: login, birth: birth, completion: { (success) in
                    if success {
                        loadData()
                        completion("",true)
                    }
                })
                
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
    
    func updateUserInformation(user: User?, login: String, password: String, name: String, birth: String, completion: (String,Bool) -> Void) {
        dataManager.updateUser(name: name, password: password, email: login, birth: birth) { (success) in
            if success {
                self.loadData()
                completion("Update User", true)
            }else {
                completion("Error", false)
            }
        }
        
    }
    
    
    
    
    
}
