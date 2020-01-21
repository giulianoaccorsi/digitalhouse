//
//  Registro.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Registro {
    public var data: Date = Date()
    public var duracao: Float
    public var custo: Float
    
    init(duracao: Float, tarifa: Float) {
        self.duracao = duracao
        self.custo = duracao * tarifa
    }
    
}
