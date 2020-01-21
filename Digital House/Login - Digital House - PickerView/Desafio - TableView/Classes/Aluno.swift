//
//  Aluno.swift
//  Desafio - TableView
//
//  Created by Giuliano Accorsi on 17/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Aluno {
    var nome: String
    var anoNascimento: String
    var semestre: String
    
    init(nome: String, anoNascimento: String, semestre: String) {
        self.nome = nome
        self.anoNascimento = anoNascimento
        self.semestre = semestre
    }
}
