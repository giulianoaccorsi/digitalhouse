//
//  Restaurante.swift
//  Exercicio04
//
//  Created by Giuliano Accorsi on 08/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Restaurante {
    var listaProdutos: [Produto] = []
    var precoTotal: Float = 0
    
    
    func removerProduto (produtoRemovido: Produto) {
        self.precoTotal -= (produtoRemovido.precoProduto * produtoRemovido.qtdProduto)
    }
    
    func devolverPrecoTotal (lista: [Produto]) {
        var temporario: Float = 0
        for produtos in self.listaProdutos {
            let multi = produtos.precoProduto * produtos.qtdProduto
            temporario += multi
        }
        self.precoTotal = temporario
    }
}
