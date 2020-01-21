//
//  vendedor.swift
//  09 - Desafio - Coliseu
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation


class Vendedor {
    var nome: String
    var listaProduto: [Produto]
    var listaVendas: [Registro] = []
    
    init(nome: String, listaProduto: [Produto]) {
        self.nome = nome
        self.listaProduto = listaProduto
    }
    public func venderProduto(nomeProduto: TiposProdutos) -> Void {
        if listaProduto.count != 0 {
            let registro: Registro = Registro(nomeVendedor: self.nome, nomeProduto: nomeProduto)
                listaVendas.append(registro)
        }else {
            print("A lista está vazia")
        }
    }
}

