//
//  main.swift
//  08 - Revisao
//
//  Created by Giuliano Accorsi on 25/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation


var aluno1: Aluno = Aluno(ano: "15/12/1996", matricula: 33333, name: "Giuliano", idade: 23, tipo: .masculino)
var aluno2: Aluno = Aluno(ano: "13/1/1999", matricula: 99999, name: "Adriano", idade: 22, tipo: .masculino)
var aluno3: Aluno = Aluno(ano: "1/5/1991", matricula: 88888, name: "Felipe", idade: 19, tipo: .masculino)
var aluno4: Aluno = Aluno(ano: "14/2/1993", matricula: 66666, name: "Alessandra", idade: 33, tipo: .feminino)
var aluno5: Aluno = Aluno(ano: "29/9/1999", matricula: 44444, name: "Julia", idade: 28, tipo: .feminino)

var escola: Escola = Escola()

escola.arraySala101 = [aluno1, aluno2, aluno3, aluno4, aluno5]
for i in escola.separarMasculino() {
    print(i.name ?? "")
}
