//
//  Cliente.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Cliente {
    public var nmrCliente: Int
    public var dataEntrada: String
    
    init(nmrCliente: Int, dataEntrada: String) {
        self.nmrCliente = nmrCliente
        self.dataEntrada = dataEntrada
    }
}
