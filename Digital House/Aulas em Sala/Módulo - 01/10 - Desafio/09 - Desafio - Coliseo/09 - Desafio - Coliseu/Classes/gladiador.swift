//
//  gladiador.swift
//  09 - Desafio - Coliseo
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Gladiador {
    var nome: String
    var vida: Float
    var ataque: Float
    var defesa: Float
    
    init(nome: String, vida: Float, ataque: Float, defesa: Float) {
        self.nome = nome
        self.vida = vida
        self.ataque = ataque
        self.defesa = defesa
    }
}
