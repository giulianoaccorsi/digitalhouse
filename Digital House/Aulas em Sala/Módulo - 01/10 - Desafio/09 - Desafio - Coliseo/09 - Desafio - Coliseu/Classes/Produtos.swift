//
//  Produtos.swift
//  09 - Desafio - Coliseu
//
//  Created by Giuliano Accorsi on 09/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

enum TiposProdutos {
    case pipoca,cocacola, agua, refri
}

class Produto {
    var nome: TiposProdutos
    var preco: Float
    
    init(nome: TiposProdutos, preco: Float) {
        self.nome = nome
        self.preco = preco
    }
}
