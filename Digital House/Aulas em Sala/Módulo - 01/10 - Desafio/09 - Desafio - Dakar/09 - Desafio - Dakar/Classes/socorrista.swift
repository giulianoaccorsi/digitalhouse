//
//  socorrista.swift
//  09 - Desafio
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
protocol Socorrer {
    func socorrer(umCompetidor: Competidor) -> Void
}

class SocorristaCarro {
    func socorrer(umCompetidor: Competidor) {
        if umCompetidor.tipo is Carro{
            print("Socorrendo Carro - \(umCompetidor.placa)")
        }else {
            print("Não é um carro, chame o Socorrista Moto")
        }
    }
    
}

class SocorristaMoto: Socorrer {
    func socorrer(umCompetidor: Competidor) {
        if umCompetidor.tipo is Moto{
            print("Socorrendo Moto - \(umCompetidor.placa)")
        }else {
            print("Não é uma moto, chame o Socorrista Carro")
        }
    }
}
