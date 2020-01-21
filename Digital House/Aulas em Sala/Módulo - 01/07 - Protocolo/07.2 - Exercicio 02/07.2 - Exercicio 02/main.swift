//
//  main.swift
//  07.2 - Exercicio 02
//
//  Created by Giuliano Accorsi on 25/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

protocol Pastorear {
    func imprimirPasto ()
}

class Animal: Pastorear {
    var data: String
    var patente: String
    var qtdProduz: Int
    
    init(data: String, patente: String, qtdProduz: Int) {
        self.data = data
        self.patente = patente
        self.qtdProduz = qtdProduz
    }
    
    func imprimirPasto() {
        print("")
    }
}

class Vaca: Animal {
    var louca: Bool
    
    init(louca: Bool, data: String, patente: String, qtdProduz: Int) {
        self.louca = louca
        super.init(data: data, patente: patente, qtdProduz: qtdProduz)
    }
    
    override func imprimirPasto() {
        print("Vaca: Produz \(self.qtdProduz) de leite")
    }
    
}

class Ovelha: Animal {
    override func imprimirPasto() {
        print("Ovelha: Produz \(self.qtdProduz) de lã")
    }
}

class Galinha: Animal {
    override func imprimirPasto() {
        print("Galinha: Produz \(self.qtdProduz) de ovo")
    }
}

class Crocodilo: Animal {
    override func imprimirPasto() {
        print("Crocodilo: Produz \(self.qtdProduz) de couro")
    }
}

class Pastor: Pastorear {
    
    var listaAnimais: [Animal] = []
    func imprimirPasto() {
        print("")
    }
    
    func pastorear () {
        for i in listaAnimais {
            i.imprimirPasto()
        }
    }
    
}

var vaca1: Vaca = Vaca(louca: false, data: "15/12/13", patente: "a", qtdProduz: 10)
var vaca2: Vaca = Vaca(louca: true, data: "3/12/12", patente: "b", qtdProduz: 20)
var ovelha1: Ovelha = Ovelha(data: "10/12/15", patente: "c", qtdProduz: 5)
var ovelha2: Ovelha = Ovelha(data: "10/12/15", patente: "d", qtdProduz: 3)
var galinha1: Galinha = Galinha(data: "4/4/13", patente: "e", qtdProduz: 40)
var galinha2: Galinha = Galinha(data: "4/4/13", patente: "f", qtdProduz: 30)

var pastor1: Pastor = Pastor()
pastor1.listaAnimais = [vaca1, vaca2, ovelha1, ovelha2, galinha1, galinha2]
pastor1.pastorear()






