import UIKit

//: # Aula 02
//: ### Dicionario
/*:
 - callout(Fase 01): Crie um dicionário com as pessoas do sua família, sendo a chave um Int e o valor o nome do seu familiar.
 */

var myFamily: [Int:String] = [5: "Adriano", 1:"Lene", 2:"Matheus", 3:"Giuliano"]

/*:
 - callout(Fase 02): Agora crie uma função que apresente todos os membros da sua família.
 */

var dicionarioAluno: [String: Any] = ["nome":"Giuliano"]
var nomeAluno: String = dicionarioAluno["nome"] as! String




func apresentaFamily (dicionario: [Int:String]) -> Void{
    for (_, value) in dicionario {
        print(value)
    }
}

//apresentaFamily(dicionario: myFamily)

/*:
 - callout(Fase 03): Sua família agora está participando de um sorteio, gere um número aleatório de 0 até a quantidade de familiares e apresente o vencedor usando a chave sorteada.
 */

func sorteiaFamily (dicionario: [Int:String]) -> (Int, String) {
    return dicionario.randomElement() ?? (0,"")
}

//print(sorteiaFamily(dicionario: myFamily))

// Criar um dicionario de marcas de carro, 3 marcas de carro, os valores sejam uma lista dos modelos de carro, o nome do carro
// adicionar via codigo e apresentar todo mundo no final

// [Honda:[(Lazaro, CRV), (Giuliano, FIT), (Adriano, HRV)], BMW:[X1,X2,X3,X6], AUDI:[A1,A2,A3,A4,A5]]


func criaCarro(nomeDoCarro: String, donoDoCarro: String) -> (String, String) {
        return (nomeDoCarro, donoDoCarro)
}

func criaMarcaComCarros(carros: [(marca: String, nome: String)]) -> [String: [(String, String)]] {
    var marcas: [String: [(String, String)]] = [:]
    var tempHonda: [(marca: String, nome: String)] = []
    var tempBMW: [(marca: String, nome: String)] = []
    var tempAudi: [(marca: String, nome: String)] = []
    for value in carros {
        if ((value.marca == "HRV") || (value.marca ==  "FIT") || (value.marca ==  "CRV"))  {
            tempHonda.append(value)
        } else if ((value.marca == "X1") || (value.marca ==  "X2") || (value.marca ==  "X3"))  {
            tempBMW.append(value)
        } else if ((value.marca == "A1") || (value.marca ==  "A2") || (value.marca ==  "A3"))  {
            tempAudi.append(value)
        }
    }
    marcas.updateValue(tempHonda, forKey: "Honda")
    marcas.updateValue(tempBMW, forKey: "BMW")
    marcas.updateValue(tempAudi, forKey: "Audi")
    return marcas
}

var carro1 = ("HRV", "Giuliano")
var carro2 = ("FIT", "Adriano")
var carro3 = ("CRV", "Lazaro")
var carro4 = ("X1", "Felipe")
var carro5 = ("X2", "Thiago")
var carro6 = ("X3", "Lucas")
var carro7 = ("A1", "Alexandre")
var carro8 = ("A2", "Julia")
var carro9 = ("A3", "Ayumi")

var listaDeCarros: [(String, String)] = []
listaDeCarros.append(carro1)
listaDeCarros.append(carro2)
listaDeCarros.append(carro3)
listaDeCarros.append(carro4)
listaDeCarros.append(carro5)
listaDeCarros.append(carro6)
listaDeCarros.append(carro7)
listaDeCarros.append(carro8)
listaDeCarros.append(carro9)


print(criaMarcaComCarros(carros: listaDeCarros))

//marcaCarro(array: d)

