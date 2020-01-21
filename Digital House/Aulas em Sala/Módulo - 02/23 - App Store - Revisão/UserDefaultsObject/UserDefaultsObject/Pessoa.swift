//
//  Pessoa.swift
//  UserDefaultsObject
//
//  Created by Digital House on 01/06/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import Foundation

enum Sexo: String {
    case f = "Feminino"
    case m = "Masculino"
}

class Pessoa: Codable {
    
    var nome: String
    var idade: Int
    var peso: Float
    var sexo: String
    
    init(nome: String, idade: Int, peso: Float, sexo: Sexo) {
        self.nome = nome
        self.idade = idade
        self.peso = peso
        self.sexo = sexo.rawValue
    }
    
}
