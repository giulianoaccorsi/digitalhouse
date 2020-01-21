//
//  main.swift
//  Aula - 02
//
//  Created by Giuliano Accorsi on 06/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation


// Dicionario ***************************************************************************************************************************

var dicionario: [String:Any] = ["nome":"Felipe",
                  "idade":22,
                  "genero":"masculino"]

var dicionarioTipado: [String:String] = ["nome":"Giuliano",
                                         "idade":"22",
                                         "genero":"masculino"]

print(dicionarioTipado.values)

dicionarioTipado.removeValue(forKey: "nome")
print(dicionarioTipado.values)

dicionarioTipado.updateValue("1.68", forKey: "altura")
print(dicionarioTipado.values)
print("-----------------------------------------------------------------")

// Array ***************************************************************************************************************************************
print("-------------- ARRAY -----------------------------")
var arrayNomes : [String] = ["Giuliano", "Felipe"]
arrayNomes.append("Gabi")
arrayNomes.remove(at: 2)
print(arrayNomes[0])

print("------------------------------------------------------------------")
// Set ****************************************************************************************************************************************]
print("--------------------- SET ---------------------------------------")

var setNomes: Set<String> = ["A", "A", "B", "C", "C", "D"]
setNomes.update(with: "D")
print(setNomes)
print("------------------------------------------------------------------")
print("---------------- EXERCICIOS ----------------------------------")
func arraysDiferentes (arrayUm: [Int], arrayDois: [Int]) -> Bool {
    var diferentes: Bool = true
    for index in arrayUm {
        print(index)
        for index2 in arrayDois{
            print(index2)
            if index == index2{
                diferentes = true
            
            }else{
                diferentes = false
            }
        }
    }
    
    return diferentes
}

var teste1 : [Int] = [1,2,3,4,5,6]
var teste2 : [Int] = [6, 8, 09, 6]
var teste3 = arraysDiferentes(arrayUm: teste1, arrayDois: teste2)
print(teste3)


for i in 1...10 {
    print(i)
}
