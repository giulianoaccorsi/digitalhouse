//
//  empresa.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Empresa: Cliente {
    public var nomeFantasia: String
    public var cnpj: Int
    
    init(nmrCliente: Int, dataEntrada: String, nomeFantasia: String, cnpj: Int) {
        self.nomeFantasia = nomeFantasia
        self.cnpj = cnpj
        super.init(nmrCliente: nmrCliente, dataEntrada: dataEntrada)
    }
}
