//
//  main.swift
//  Ju
//
//  Created by Giuliano Accorsi on 15/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Pessoa {
    var nome: String?
    var sobrenome: String?
    var idade: Int?
    var sexo: String?
    
    init(nome: String?, sobrenome: String?, idade: Int?, sexo: String){
        self.nome = nome
        self.sobrenome = sobrenome
        self.idade = idade
        self.sexo = sexo
    }
}


class Aluno: Pessoa {
    var matricula: Int?
    var numeroChamada: Int?
    var ano: Int?
    
    init(matricula: Int?, numeroChamada: Int?, ano: Int?, nome: String?, sobrenome: String?, idade: Int?, sexo: String) {
        super.init(nome: nome, sobrenome: sobrenome, idade: idade, sexo: sexo)
        self.matricula = matricula
        self.numeroChamada = numeroChamada
        self.ano = ano
    }
    
}


class Turma {
    var periodo: String?
    var arrayAluno: [Aluno] = []
    
    init(periodo: String?, arrayAluno: [Aluno]){
        self.periodo = periodo
        self.arrayAluno = arrayAluno
    }
    
    func turmaMasculino() -> [Aluno] {
        
        var lista2: [Aluno] = []
        for i in self.arrayAluno {
            if i.sexo == "M" {
                lista2.append(i)
                
            }
        }
        return lista2
    }
    
    func imprimeTudo(lista: [Aluno]) -> Void {
        
        for i in self.turmaMasculino() {
            print("Nome: \(i.nome ?? "a") Sobrenome: \(i.sobrenome ?? "a") Idade: \(i.idade ?? 0)")
        }
    }
}

//    func imprimaTudo() -> Void {
//        let alunos = self.arrayAluno.map({$0.nome ?? "a"})
//        print(alunos)
//
//    }
//


//    func oJeitoFacilDeViverAvida() -> [Aluno] {
//
//        return self.arrayAluno.filter({$0.sexo == "M"})
//
//}

var aluno1 = Aluno(matricula: 10, numeroChamada: 1, ano: 1, nome: "Fernando", sobrenome: "Moredo", idade: 20, sexo: "M")
var aluno2 = Aluno(matricula: 20, numeroChamada: 2, ano: 1, nome: "Marta", sobrenome: "Lima", idade: 22, sexo: "F")
var aluno3 = Aluno(matricula: 30, numeroChamada: 3, ano: 1, nome: "Jane", sobrenome: "Pereira", idade: 25, sexo: "F")
var aluno4 = Aluno(matricula: 40, numeroChamada: 4, ano: 2, nome: "Fernanda", sobrenome: "Santos", idade: 20, sexo: "F")
var aluno5 = Aluno(matricula: 50, numeroChamada: 5, ano: 2, nome: "Felipe", sobrenome: "Miranda", idade: 29, sexo: "M")
var aluno6 = Aluno(matricula: 60, numeroChamada: 6, ano: 2, nome: "Talita", sobrenome: "Akemi", idade: 20, sexo: "F")
var aluno7 = Aluno(matricula: 70, numeroChamada: 7, ano: 3, nome: "Carlos", sobrenome: "Brandao", idade: 25, sexo: "M")
var aluno8 = Aluno(matricula: 80, numeroChamada: 8, ano: 3, nome: "Giuliano", sobrenome: "Costa", idade: 22, sexo: "M")
var aluno9 = Aluno(matricula: 90, numeroChamada: 9, ano: 3, nome: "Jaqueline", sobrenome: "Marques", idade: 20, sexo: "F")

var turmaAlunos: [Aluno] = [aluno1, aluno2, aluno3,aluno4, aluno5, aluno6, aluno7, aluno8, aluno9]


var matutino: Turma = Turma(periodo: "Matutino", arrayAluno: turmaAlunos)

matutino.imprimeTudo(lista: (matutino.turmaMasculino()))









