//
//  Users.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 18/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class User: Codable {
    var login: String
    var password: String
    var dateBirth: String
    
    init(login: String, password: String, dateBirth: String) {
        self.login = login
        self.password = password
        self.dateBirth = dateBirth
    }
}
