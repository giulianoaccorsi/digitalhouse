    //
//  Pessoa.swift
//  08 - Revisao
//
//  Created by Giuliano Accorsi on 25/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

    enum TipoPessoa {
        case masculino, feminino
    }
    
    
import Foundation
    class Pessoa {
        var name: String?
        var idade: Int?
        var tipo: TipoPessoa
        
        init(name: String?, idade:Int?, tipo: TipoPessoa) {
            self.name = name
            self.idade = idade
            self.tipo = tipo
        }
    }
