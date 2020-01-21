//
//  Monumento.swift
//  Desafio - Navigation Bandeiras
//
//  Created by Giuliano Accorsi on 04/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Monumento {
    var nome: String
    var nomePais: String
    var nomeImagem: String
    var nomeBandeira: String
    
    init(nome: String, nomePais: String, nomeImagem: String, nomeBandeira: String) {
        self.nome = nome
        self.nomePais = nomePais
        self.nomeImagem = nomeImagem
        self.nomeBandeira = nomeBandeira
    }
}
