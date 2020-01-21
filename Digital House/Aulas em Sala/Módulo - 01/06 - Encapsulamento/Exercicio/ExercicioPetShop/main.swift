//
//  main.swift
//  ExercicioPetShop
//
//  Created by Giuliano Accorsi on 22/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

enum RacaCachorro {
    case borderCollie, pastorAlemao, pug
}

enum RacaGato {
    case persa, sphynx, norueguesDaFloresta
}

enum RacaPorco {
    case landrace, pietrain, canastra
}

enum RacaAves {
    case picapau, papagaio, canario
}

enum TipoAnimais {
    case cachorro, gato, porco, ave
}

class Animal {
    var tipo: TipoAnimais
    var pelo: Bool?
    var pes: Int?
    var cauda: Bool?
    var bico: Bool?
    var asas: Bool?
    
    init(tipo: TipoAnimais, pelo: Bool?, pes: Int?, cauda: Bool?, bico: Bool?, asas: Bool?) {
        self.tipo = tipo
        self.pelo = pelo
        self.pes = pes
        self.cauda = cauda
        self.bico = bico
        self.asas = asas
    }
    
    private func andar() -> Void {
        print("Andando.. uhuu")
    }
    
    func emitirSom() -> Void {
        print("Barulhooo")
    }
    
}
class Cachorro: Animal {
    var raca: RacaCachorro
    var porte: String
    
    init(raca: RacaCachorro, porte: String, tipo: TipoAnimais, pelo: Bool?, pes: Int?, cauda: Bool?, bico: Bool?, asas: Bool?) {
        self.raca = raca
        self.porte = porte
        super.init(tipo: tipo,pelo: pelo, pes: pes, cauda: cauda, bico: bico, asas: asas)
    }
    
    override func emitirSom() {
        print("Au au au au !")
    }
    
    func morderOsso () -> Void {
        print("Mordendo o osso :3 ")
    }
    
}

class Gatos: Animal {
    var raca: RacaGato
    var porte: String
    
    init(raca: RacaGato, porte: String, tipo: TipoAnimais,pelo: Bool?, pes: Int?, cauda: Bool?, bico: Bool?, asas: Bool?) {
        self.raca = raca
        self.porte = porte
        super.init(tipo: tipo,pelo: pelo, pes: pes, cauda: cauda, bico: bico, asas: asas)
    }
    
    override func emitirSom() {
        print("Miaaaaaaaaau !")
    }
    
    func ronronar() -> Void {
        print("Ronronar")
    }
    
}
class Porcos:Animal {
    var kilo: Int
    var raca: RacaPorco
    
    init(kilo: Int, raca: RacaPorco, tipo: TipoAnimais, pelo: Bool?, pes: Int?, cauda: Bool?, bico: Bool?, asas: Bool?) {
        self.kilo = kilo
        self.raca = raca
        super.init(tipo: tipo, pelo: pelo, pes: pes, cauda: cauda, bico: bico, asas: asas)
    }
    
    override func emitirSom() {
        print("Roinc Roinc")
    }
    
    func sujarLama () -> Void {
        print("Brincar na Lama")
    }
}
class Aves: Animal {
    var tipoVoo: String
    var raca: RacaAves
    
    init(tipoVoo: String, raca: RacaAves, tipo: TipoAnimais,pelo: Bool?, pes: Int?, cauda: Bool?, bico: Bool?, asas: Bool?) {
        self.tipoVoo = tipoVoo
        self.raca = raca
        super.init(tipo: tipo,pelo: pelo, pes: pes, cauda: cauda, bico: bico, asas: asas)
    }
    
    override func emitirSom() {
        print("Piu Piu !")
    }
    
    func voar () -> Void {
        print("Flyiiiiiiiiing !!! ")
    }
    
}

class PetShop {
    
    func juntarAnimais (animal: Animal) -> [Animal] {
        var jaula: [Animal] = []
        jaula.append(animal)
        return jaula
    }
    
    func separarAnimais(array: [Animal], tipo: TipoAnimais) -> [Animal] {
        
        return array.filter({$0.tipo == tipo})
        
    }
    
    func separarRacaCachorro(array: [Animal], raca: RacaCachorro) -> [Cachorro] {
        var arrayCachorro: [Cachorro] = []
        for animal in array {
            if animal is Cachorro {
                let animalRecebido: Cachorro = animal as! Cachorro
                if animalRecebido.raca == raca{
                    arrayCachorro.append(animalRecebido)
                }
            }
        }
        
        return arrayCachorro
    }
    
    func separarRacaGato(array: [Animal], raca: RacaGato) -> [Gatos] {
        var arrayGatos: [Gatos] = []
        for animal in array {
            if animal is Gatos {
                let animalRecebido: Gatos = animal as! Gatos
                if animalRecebido.raca == raca {
                    arrayGatos.append(animalRecebido)
                }
            }
        }
        
        return arrayGatos
    }
    
    func separarRacaPorco(array: [Animal], raca: RacaPorco) -> [Porcos] {
        var arrayPorcos: [Porcos] = []
        for animal in array {
            if animal is Porcos {
                let animalRecebido: Porcos = animal as! Porcos
                if animalRecebido.raca == raca {
                    arrayPorcos.append(animalRecebido)
                }
            }
        }
        return arrayPorcos
    }
    
    func separarRacaAves(array: [Animal], raca: RacaAves) -> [Aves] {
        var arrayAves: [Aves] = []
        for animal in array {
            if animal is Aves {
                let animalRecebido: Aves = animal as! Aves
                if animalRecebido.raca == raca {
                    arrayAves.append(animalRecebido)
                }
            }
        }
        return arrayAves
    }
    
    func imprimirSom(array:[Animal]){
        
        for value in array {
            value.emitirSom()
        }
    }
    
}




var cachorro1: Cachorro = Cachorro(raca: .borderCollie, porte: "Medio", tipo: .cachorro, pelo: true, pes: 4, cauda: true, bico: false, asas: false)
var cachorro2: Cachorro = Cachorro(raca: .pug, porte: "pequeno", tipo: .cachorro, pelo: true, pes: 4, cauda: true, bico: false, asas: false)
var cachorro3: Cachorro = Cachorro(raca: .pastorAlemao, porte: "Grande", tipo: .cachorro, pelo: true, pes: 4, cauda: true, bico: false, asas: false)

var gato1: Gatos = Gatos(raca: .norueguesDaFloresta, porte: "Grande", tipo: .gato, pelo: true, pes: 4, cauda: true, bico: false, asas: false)
var gato2: Gatos = Gatos(raca: .persa, porte: "Medio", tipo: .gato, pelo: true, pes: 4, cauda: true, bico: false, asas: false)
var gato3: Gatos = Gatos(raca: .sphynx, porte: "Pequeno", tipo: .gato, pelo: true, pes: 4, cauda: true, bico: false, asas: false)

var porco1: Porcos = Porcos(kilo: 10, raca: .canastra, tipo: .porco, pelo: false, pes: 4, cauda: true, bico: false, asas: false)
var porco2: Porcos = Porcos(kilo: 10, raca: .landrace, tipo: .porco, pelo: false, pes: 4, cauda: true, bico: false, asas: false)
var porco3: Porcos = Porcos(kilo: 10, raca: .pietrain, tipo: .porco, pelo: false, pes: 4, cauda: true, bico: false, asas: false)

var ave1: Aves = Aves(tipoVoo: "Alto", raca: .canario, tipo: .ave, pelo: true, pes: 2, cauda: true, bico: true, asas: true)
var ave2: Aves = Aves(tipoVoo: "Medio", raca: .papagaio, tipo: .ave, pelo: true, pes: 2, cauda: true, bico: true, asas: true)
var ave3: Aves = Aves(tipoVoo: "Pequeno", raca: .picapau, tipo: .ave, pelo: true, pes: 2, cauda: true, bico: true, asas: true)

var jaula: [Animal] = [cachorro1, cachorro2, cachorro3, gato1, gato2, gato3, porco1, porco2, porco3, ave1, ave2, ave3]
var petShop: PetShop = PetShop()
print(petShop.separarAnimais(array: jaula, tipo: .cachorro))
petShop.imprimirSom(array: jaula)







