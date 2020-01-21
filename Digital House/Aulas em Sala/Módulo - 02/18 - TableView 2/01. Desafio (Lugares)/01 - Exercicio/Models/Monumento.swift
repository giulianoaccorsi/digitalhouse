//
//  Monumento.swift
//  01 - Exercicio
//
//  Created by Giuliano Accorsi on 22/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Monumento {
    var nomeMonumento: String
    var nomePais: String
    var imagemMain: String
    var imagemMaior: String
    var imagemBandeira: String
    
    init(nomeMonumento: String, nomePais: String, imagemMain: String, imagemMaior: String, imagemBandeira: String) {
        self.nomeMonumento = nomeMonumento
        self.nomePais = nomePais
        self.imagemMain = imagemMain
        self.imagemMaior = imagemMaior
        self.imagemBandeira = imagemBandeira
    }
}
