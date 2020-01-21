//
//  pessoafisica.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class PessoaFisica: Cliente {
    public var nome: String
    public var sobrenome: String
    public var rg: Int
    
    init(nome: String, sobrenome: String, rg: Int, nmrCliente: Int, dataEntrada: String) {
        self.nome = nome
        self.sobrenome = sobrenome
        self.rg = rg
        super.init(nmrCliente: nmrCliente, dataEntrada: dataEntrada)
    }
}
