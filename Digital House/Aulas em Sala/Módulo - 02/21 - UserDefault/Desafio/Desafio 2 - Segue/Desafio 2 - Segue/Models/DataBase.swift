//
//  BancoDados.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 18/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class DataBase: Codable {
    private static let usersKey = "usersKey"
    
    static func adicionarUsuario(usuario: User) {
        var currentUsers: [User] = getUsers()
        currentUsers.append(usuario)
        DataBase.updateUsers(users: currentUsers)
    }
    
    private static func updateUsers(users: [User]) {
        let jsonEncoder = JSONEncoder()
        var datas: [Data] = []
        users.forEach {
            do {
                let jsonData: Data = try jsonEncoder.encode($0)
                datas.append(jsonData)
            } catch { return }
        }
        UserDefaults.standard.set(datas, forKey: usersKey)
    }
    
    static func getUsers() -> [User] {
        var users: [User] = []
        if let datas: [Data] = UserDefaults.standard.array(forKey: usersKey) as? [Data] {
            datas.forEach {
                do {
                    let user: User =  try JSONDecoder().decode(User.self, from: $0)
                    users.append(user)
                } catch {
                    return
                }
            }
        }
        return users
    }
    
    static func removeUser(index: Int) {
        var currentUsers: [User] = getUsers()
        currentUsers.remove(at: index)
        updateUsers(users: currentUsers)
    }
    
}
