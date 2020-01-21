import UIKit

//: # Aula 03
//: ### Opcional
/*:
 - callout(Exercicio 01): Assumindo três variáveis usadas para representar uma pessoa(primeiroNome, segundoNome, sobrenome), imprimir na tela o nome completo.
 - Definir as três variáveis (lembrando que nem todas as pessoas têm um segundo nome) e atribuir um valor a cada uma.
 - Imprimir na tela o nome completo da pessoa.

 */


var nome: String?
var peso: Float?

if let nomeRecebido = nome {
    print(nomeRecebido)
}

//let nomeRecebido2 = nome!

let pesoRecebido = peso ?? 0
print(pesoRecebido)



/*:
 - callout(Exercicio 02): Dada uma variável do tipo String? com o número do documento de uma pessoa (sem pontos), verificar se a variável contem valor, caso não tenha inserir o valor default XXXXXXXX-X,  não usar o if ternário.
 */


var numeroDocumento: String? = "396196767"

if let numeroRG = numeroDocumento {
    print(numeroRG)
} else {
    print("XXXXXXXX-X")
}



/*:
 - callout(Exercicio 03): Fazer uma função que receba os parâmetros de uma carro (modelo, qtdRodas, cor) e retorne um dicionário com o carro que populamos nos parametros. Depois adicionar esse carro em um array. Por fim fazer uma função que recebe o array de carro e retorna um carro sorteado.


 */
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


/*:
 - callout(Exercicio 04): Uma das pessoas responsáveis por administrar a pesquisa decide montar uma lista com os nomes de todos os participantes, já que sabe que "Lobão" estava no cinema no momento da pesquisa. Escrever uma função que, dado um array com os nomes dos participantes, retorne a posição em que “Lobão” se encontra.
 - Modificar a função anterior para usar o método index(of:) da classe Array.
 
 */
func procuraLobao (lista: [String]) -> Void {

    for (index, value) in lista.enumerated() {
        if value == "Lobao" {
            print(index)
        }
    }
}

var lista1: [String] = ["Giuliano", "Adriano", "Matheus", "Lobao", "Felipe", "Lazaro", "Ayumi", "Irene"]
var lista2: [String] = ["Giuliano", "Adriano", "Matheus", "Irene", "Felipe", "Lazaro", "Ayumi", "Lobao"]

procuraLobao(lista: lista2)
