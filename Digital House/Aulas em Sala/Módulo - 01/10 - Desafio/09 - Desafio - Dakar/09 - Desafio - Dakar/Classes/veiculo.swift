//
//  veiculo.swift
//  09 - Desafio
//
//  Created by Giuliano Accorsi on 30/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Veiculo {
    var peso: Float?
    var qtdRodas: Int?

}

class Carro: Veiculo {
    override init() {
        super.init()
        self.peso = 1000
        self.qtdRodas = 4
    }
    
}

class Moto: Veiculo {
    override init() {
        super.init()
        self.peso = 300
        self.qtdRodas = 2
    }
    
}

