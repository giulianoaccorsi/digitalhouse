//
//  Escola.swift
//  08 - Revisao
//
//  Created by Giuliano Accorsi on 25/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Escola {
    
    var arraySala101: [Aluno] = []
    func obterMatriculas () {
        for value in arraySala101 {
            print(value.getMatricula())
        }
    }
    
    func separarMasculino() -> [Aluno]{
       return arraySala101.filter({$0.tipo == .masculino})
    }
    
}
