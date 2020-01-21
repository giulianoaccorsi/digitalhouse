//
//  registro.swift
//  09 - Desafio - Coliseu
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Registro {
    var nomeVendedor: String
    var nomeProduto: TiposProdutos
    var dataVenda: Date = Date()
    
    init(nomeVendedor: String, nomeProduto: TiposProdutos) {
        self.nomeVendedor = nomeVendedor
        self.nomeProduto = nomeProduto
    }
}
