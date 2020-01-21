import UIKit

//: # Aula 02
//: ### Array
/*:
 - callout(Exercicio 01): Definir o método arraysDiferentes que deve usar dois arrays de inteiros e retornas true caso sejam diferentes e false caso coincidam
 */




func arraysDiferentes (arrayUm: [Int], arrayDois: [Int]) -> Bool{
    
    if arrayUm != arrayDois{
        return true
    }else{
        return false
    }
    
    
}

var a = [1,2,3]
var b = [1,2,3]

arraysDiferentes(arrayUm: a, arrayDois: b)



/*:
 - callout(Exercicio 02): Definir o metodo media, que deve analisar um array de numeros inteiros e calcular a média entre os números armazenados nele.
 */

func media (numeros: [Int]) -> Double {
    var dividendo : Int = 0
    let divisor : Int = numeros.count
    for i in numeros{
        dividendo += i
    }
    let resultado : Double = Double(dividendo/divisor)
    return resultado
    
}

var c = [3,5,7]
media(numeros: c)


/*:
 - callout(Exercicio 03): Definir um método que use como parâmetro um array de números inteiros e retorne outro array que contenha apenas os números pares do primeiro array.

 */

func apenasPares (lista: [Int]) -> [Int] {
    var lista2:[Int] = []
    for i in lista {
        if i % 2 == 0 {
            lista2.append(i)
        }
    }
    return lista2
}

var d = [2,3,4]
apenasPares(lista: d)

/*:
 - callout(Exercicio 04): Escrever um método que use como parâmetro um array de números inteiros e retorne a soma de todos os seus elementos pares.
 
 */

func somaPares(lista: [Int]) -> Int {
    var soma:Int = 0
    for i in lista {
        if i % 2 == 0 {
            soma += i
        }
    }
    return soma
    
}
var e = [2,3,4]
somaPares(lista: e)


/*:
 - callout(Exercicio 05): Escrever um método que crie e retorne um array com os primeiros 10 números naturais.
 
 */

func criaArrayNatural() -> [Int] {
    var naturais : [Int] = []
    for i in 1...10 {
        naturais.append(i)
    }
    return naturais
}

criaArrayNatural()

/*:
 - callout(Exercicio 06): Escrever um método que crie e retorne um array com os primeiros 50 números naturais.
 */

func criaNaturais() -> [Int] {
    var naturais : [Int] = []
    for i in 1...50 {
        naturais.append(i)
    }
    return naturais
}
criaNaturais()

/*:
 - callout(Exercicio 07): Escrever um método que use como parâmetro um número inteiro n, e depois crie e retorne um array com  os 10 primeiros números naturais a partir dele
 */

func criaArrayN(numero: Int) -> [Int] {
    var lista : [Int] = []
    for i in numero...numero+10 {
        lista.append(i)
    }
    return lista
}
criaArrayN(numero: 20)

/*:
 - callout(Exercicio 08): Escrever um método que use como parâmetro dois números inteiros e depois crie e retorne um array com os números inteiros que se encontrem entre eles.
 */

func encontraNumero(numero: Int, numero2: Int) -> [Int] {
    var lista : [Int] = []
    for i in numero...numero2 {
        lista.append(i)
    }
    return lista
}

encontraNumero(numero: 3, numero2: 5)

/*:
 - callout(Exercicio 09): Definir um método: resultadosDaRoleta(quantidade: Int) -> [Int] que gere e retorne uma lista de números inteiros aleatórios com ’quantidade’ de valores, onde cada valor é o resultado de um giro da roleta. (Dado: a roleta tem 36 números)
 */

func resultadoDaRoleta(quantidade: Int) -> [Int] {
    var numeros : [Int] = []
    for _ in 1...quantidade {
        numeros.append(Int.random(in: 0...36))
    }
    return numeros
}

resultadoDaRoleta(quantidade: 2)

/*:
 - callout(Exercicio 10): Definir um método inverso(numeros: [Int]) -> [Int] que retorne o inverso de um array de números (sem usar a função reverse do array).
 */

func inverso(numero: [Int]) -> [Int] {
    
    var inverso = numero
    var lista : [Int] = []
    for _ in inverso {
        lista.append(inverso.endIndex)
        inverso.removeLast()
    }
    return lista
}

var f = [1,2,3]
inverso(numero: f)




