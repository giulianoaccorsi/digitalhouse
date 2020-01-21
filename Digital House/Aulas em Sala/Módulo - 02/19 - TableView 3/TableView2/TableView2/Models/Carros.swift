//
//  Carros.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 21/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
class Carro {
    var nome: String
    var nomeImagem: String
    var ano: Int
    var km: Float
    var preco: Float
    
    init (nome: String, nomeImagem: String, ano: Int, km: Float, preco: Float) {
        self.nome = nome
        self.nomeImagem = nomeImagem
        self.ano = ano
        self.km = km
        self.preco = preco
    }
}
