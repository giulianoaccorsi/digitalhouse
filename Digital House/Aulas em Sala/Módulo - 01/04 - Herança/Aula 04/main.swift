//
//  main.swift
//  Aula 04
//
//  Created by Giuliano Accorsi on 11/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Animal {
    var cor: String?
    var orelha: Bool?
    var tamanho: String?
    var olhos: Bool?
    var pelos: Bool?
    var pes: Bool?
    var sexo: String?
    var rabo: Bool?
    var raca: String?
    var idade: Int?
    
    
    init(cor: String?, orelha: Bool?, tamanho: String?, olhos:Bool?, pelos: Bool?, pes: Bool?, sexo: String?, rabo:Bool?, raca:String?, idade:Int?) {
        self.cor = cor
        self.orelha = orelha
        self.tamanho = tamanho
        self.olhos = olhos
        self.pelos = pelos
        self.pes = pes
        self.sexo = sexo
        self.rabo = rabo
        self.raca = raca
        self.idade = idade
        
    }
    
    
    
    func andar () -> Void {
        print("Andar")
    }
    
    func correr () -> Void {
        print("Correndo")
    }
    
    func comer () {
        print("Comendoo")
    }
}

class Coelho: Animal {
    
    func saltar() -> Void {
        print("Saltandooooo")
    }
    
}

class Cachorro: Animal {
    func latir() -> Void {
        print("Latir")
    }
    
    
}

class Vaca: Animal {
    var chifre: Bool?
    var teta: Int?
    var tipo: String?
    
    init(chifre: Bool?, teta: Int?, tipo: String?, cor: String?, orelha: Bool?, tamanho: String?, olhos:Bool?, pelos: Bool?, pes: Bool?, sexo: String?, rabo:Bool?, raca:String?, idade:Int?) {
        super.init(cor: cor, orelha: orelha, tamanho: tamanho, olhos: olhos, pelos: pelos, pes: pes, sexo: sexo, rabo: rabo, raca: raca, idade: idade)
        self.chifre = chifre
        self.teta = teta
        self.tipo = tipo
    }
    
    
    func mugir () -> Void {
        print("MUUUUUUUUU")
    }
    
    func darLeite () -> Void {
        print("Leite")
    }
}



class Porco: Animal {
    var sujo: Bool?
    var selvagem: Bool?
    
    init(sujo: Bool?, selvagem: Bool?, animal: Animal) {
        super.init(cor: animal.cor, orelha: animal.orelha, tamanho: animal.tamanho, olhos: animal.olhos, pelos: animal.pelos, pes: animal.pes, sexo: animal.sexo, rabo: animal.rabo, raca: animal.raca, idade: animal.idade)
        self.sujo = sujo
        self.selvagem = selvagem
        
    }
    
    func roncar () {
        print("Roncar")
    }
    
    
}

var teste1: Animal = Animal(cor: "Preto", orelha: true, tamanho: "teste", olhos: true, pelos: true, pes: true, sexo: "Teste", rabo: false, raca: "teste", idade: 10)
var teste2: Porco = Porco(sujo: true, selvagem: false, animal: teste1)
var teste3: Vaca = Vaca(chifre: true, teta: 10, tipo: "aaa", cor: "Preto", orelha: true, tamanho: "AA", olhos: true, pelos: true, pes: true, sexo: "aa", rabo: true, raca: "aa", idade: 10)








class Cadeira {
    
    var assento: Bool?
    var cor: String?
    var qtdPes: Int?
    var encosto: Bool?
    
    func mover () {
        print("Andando")
    }
    
    func imprimeTudo () -> Void {
        let imprimeAssento = self.assento ?? true
        let imprimeCor = self.cor ?? ""
        let imprimeQtd = self.qtdPes ?? 0
        let imprimeEncosto = self.encosto ?? true
        
        let lista: [Any] = [imprimeAssento, imprimeCor, imprimeQtd, imprimeEncosto]
        for i in lista {
            print(i)
        }
        
    }
    
    init(assento: Bool?, cor: String?, qtdPes: Int?, encosto: Bool?) {
        self.assento = assento
        self.cor = cor
        self.qtdPes = qtdPes
        self.encosto = encosto
        
    }
}

class FlexForm: Cadeira {
    var almofada: Bool?
    var rodas: Bool?
    var alavanca: Bool?
    var bracos:Bool?
    
    func girar() {
        print("Girar")
    }
    
    func subir () {
        print("Subindo")
    }
    
    func descer () {
        print("Descendo")
    }
    
    func moverEncosto () {
        print("Movendo")
    }
    
    func imprime2 () -> Void {
        self.imprimeTudo()
        print(self.almofada ?? false)
        print(self.rodas ?? false)
        print(self.alavanca ?? false)
        print(self.bracos ?? false)
    }
    
    init(almofada: Bool?, rodas: Bool?, alavanca: Bool?, bracos: Bool?, assento: Bool?, cor: String?, qtdPes: Int?, encosto: Bool?) {
        super.init(assento: assento, cor: cor, qtdPes: qtdPes, encosto: encosto)
        
        self.almofada = almofada
        self.rodas = rodas
        self.alavanca = alavanca
    }
    
}

var cadeiraRuim: Cadeira = Cadeira(assento: true, cor: "preto", qtdPes: 4, encosto: true)
var cadeiraFlex: FlexForm = FlexForm(almofada: true, rodas: false, alavanca: true, bracos: false, assento: true, cor: "cinza", qtdPes: 4, encosto: false)
var cadeiraFlex2: FlexForm = FlexForm(almofada: true, rodas: true, alavanca: true, bracos: true, assento: true, cor: "azul", qtdPes: 4, encosto: false)
var cadeiraFlex3: FlexForm = FlexForm(almofada: false, rodas: false, alavanca: false, bracos: false, assento: false, cor: "branco", qtdPes: 4, encosto: false)

cadeiraFlex.imprime2()
