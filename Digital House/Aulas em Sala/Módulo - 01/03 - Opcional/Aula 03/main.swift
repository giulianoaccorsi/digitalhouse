//
//  main.swift
//  Aula 03
//
//  Created by Giuliano Accorsi on 09/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

var nome: String?
var peso: Float?

if let nomeRecebido = nome {
    print(nomeRecebido)
}

//let nomeRecebido2 = nome!

let pesoRecebido = peso ?? 0
print(pesoRecebido)

// Exercicios **************************************************************************

var primeiroNome: String
var segundoNome: String?
var sobrenomeNome: String

primeiroNome = "Giuliano "
//segundoNome = "Da Costa "
sobrenomeNome = "Accorsi"

if segundoNome == nil {
    print(primeiroNome + sobrenomeNome)
}else{
    let segundoNomeRecebido = segundoNome ?? ""
     print(primeiroNome + segundoNomeRecebido + sobrenomeNome)
}


// Exercicio 02 ****************************************************************************************

var numeroDocumento: String? = "396196767"

if let numeroRG = numeroDocumento {
    print(numeroRG)
} else {
    print("XXXXXXXX-X")
}

// Exercicio 03 ***************************************************************************************

func criaCarrro (modelo: String, qtdRodas:  String, cor: String) -> [String:String] {
    let carro: [String:String] = ["modelo":modelo, "rodas":qtdRodas, "cor":cor]
    return carro
}

var carro1 = criaCarrro(modelo: "Civic", qtdRodas: "4", cor: "Preto")
var carro2 = criaCarrro(modelo: "HRV", qtdRodas: "4", cor: "Cinza")
var carro3 = criaCarrro(modelo: "FIT", qtdRodas: "4", cor: "Azul")

var arrayCarros: [[String:String]] = [carro1, carro2, carro3]

func sorteaCarros (arrayDic: [[String:String]]) -> [String:String] {
    
    if arrayDic.count > 0 {
        return arrayDic.randomElement()!
    }
    
    return [:]
}

print(sorteaCarros(arrayDic: arrayCarros))

