//
//  competidor.swift
//  09 - Desafio
//
//  Created by Giuliano Accorsi on 30/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Competidor {
    
    var velocidade: Int
    var aceleracao: Int
    var giro: Int
    var placa: String
    var tipo: Veiculo

    init(velocidade: Int, aceleracao: Int, giro: Int, placa: String, tipo: Veiculo) {
        self.velocidade = velocidade
        self.aceleracao = aceleracao
        self.giro = giro
        self.placa = placa
        self.tipo = tipo
    }
    
}
