//
//  App.swift
//  23 - App Store - Revisão
//
//  Created by Giuliano Accorsi on 05/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

enum Categoria: String {
    case jogo = "Jogos"
    case fitness = "Fitness"
    case financas = "Finanças"
    case educacao = "Educação"
    case mobilidade = "Mobilidade"
    
    func returnString() -> String {
        return self.rawValue
    }
}

import Foundation
class App {
    var imagem: String
    var nome: String
    var price: String
    var so: SO
    var categoria: Categoria
    
    init(imagem: String, nome: String, price: String, so: SO, categoria: Categoria) {
        self.imagem = imagem
        self.nome = nome
        self.price = price
        self.so = so
        self.categoria = categoria
    }
}
