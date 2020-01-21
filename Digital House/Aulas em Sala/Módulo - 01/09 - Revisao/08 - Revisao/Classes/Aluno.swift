//
//  Aluno.swift
//  08 - Revisao
//
//  Created by Giuliano Accorsi on 25/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Aluno: Pessoa {
    var ano: String?
    private var matricula: Int?
    
    init(ano: String?, matricula: Int?, name: String?, idade:Int?, tipo: TipoPessoa) {
        self.ano = ano
        self.matricula = matricula
        super.init(name: name, idade: idade, tipo: tipo)
    }
    
    func getMatricula() -> Int {
        return self.matricula ?? 0
    }
    
    
}
