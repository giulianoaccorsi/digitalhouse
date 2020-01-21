//
//  main.swift
//  Aula - 01
//
//  Created by Giuliano Accorsi on 04/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation


// Exemplos de Tipos ************************************************************************

var valor : Int = 11 // Sempre falar o Tipo da variavel
var peso : Double = 88.4
var name: String = "Giuliano Accorsi"
var sabeAndarDeBike : Bool = false
var teste : [String] = ["A", "B", "C", "D", "E"]

// Loops *************************************************************************************

for (index, elementos) in teste.enumerated(){
    print("Resultado: \(elementos) \(index)")
}


var index : Int = 1
repeat {
    print("Index: \(index)")
    index += 1
}while index <= 5


var i : Int = 1
while i <= 10 {
    print("I: \(i)")
    i += 1
    
}



// Exercicios ********************************************************************************
var umNumeroA : Int = 10
var umNumeroB : Double = 11.2
var umNumeroC : String    = "Teste"

var segundos : Double = 86400
print("Exercicio 01 -----------------")
print(umNumeroA)
print(umNumeroB)
print(Double(umNumeroA) + umNumeroB)
print(Double(umNumeroA) - umNumeroB)

print("Exercicio 02 ------------------")
print(segundos * 365)

print("Exercicio 03 ------------------")
for naturais in 1...10{
    print(pow(Double(naturais), 2))
}

print("Exercicio 04 ------------------")
for impares in 1...10{
    if (impares % 2) == 1{
        print(impares)
    }
}
print("Exercicio 05 ------------------")
var numero = arc4random_uniform(5)
while numero != 3 {
    numero = arc4random_uniform(5)
    print(numero)
}

// Funções ******************************************************************************************
print("Funções ------------------")
func cumprimentar (pessoa: String) {
    print("Olá \(pessoa) !!")
}
cumprimentar(pessoa: "João")

func eMenor(oPrimeiro: Int, oSegundo: Int) -> Bool {
    if oPrimeiro < oSegundo {
        print("Verdade !")
        return true
    }else{
        print("Falso !")
        return false
    }
}

eMenor(oPrimeiro: 10, oSegundo: 20)

func testeImpar(umNumero: Int) -> Bool {
    if umNumero % 2 == 1 {
        print("O número é impar")       
        return true
    }else {
        print("O número é par")
        return false
    }
}

testeImpar(umNumero: 14)

func imprimirImpares () -> Void {
    for numero in 0...100{
        if numero % 2 == 1 {
            print(numero)
        }
    }
}


imprimirImpares()





