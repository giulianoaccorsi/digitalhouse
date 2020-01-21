//
//  Moto.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 25/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//


import UIKit
class Moto: Veiculo {
    var tipo: String
    init(tipo: String, modelo: String, nomeImagem: String, preco: Float) {
        self.tipo = tipo
        super.init(nome: modelo, nomeImagem: nomeImagem, ano: 0, km: 0.0, preco: preco)
    }
}
