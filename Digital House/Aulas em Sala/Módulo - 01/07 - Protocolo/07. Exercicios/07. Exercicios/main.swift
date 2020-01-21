//
//  main.swift
//  07. Exercicios
//
//  Created by Giuliano Accorsi on 24/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

protocol Voador {
    func voar() -> Void
}

class Pato: Voador {
    var energia:Int = 10
    func voar() {
        energia -= 5
        print("Estou voando como um pato\nEnergia: \(energia)")
    }
    
    
}

class Aviao: Voador {
    var horasVoo: Int = 0
    func voar() {
        horasVoo += 13
        print("Estou voando como um Avião !!\nHoras Voo: \(horasVoo)")
        
    }
    
    
}

class SuperHomem: Voador {
    var experiencia: Int = 0
    func voar() {
        experiencia += 3
        print("Estou voando como um Campeão !!\nHoras Voo: \(experiencia)")
    }
    
    
}

class TorreDeControle {
    var listaVoadores: [Voador] = []
    public func vemTodos () -> Void {
        for value in listaVoadores {
            value.voar()
        }
    }
    
    public func adicionarVoador (umVoador: Voador) -> Void {
        self.listaVoadores.append(umVoador)
    }
}

protocol Imprivivel {
    func imprimir() -> Void
}

class Contrato: Imprivivel {
    func imprimir() {
        print("Sou um Contrato !!")
    }
    
}

class Foto: Imprivivel {
    func imprimir() {
        print("Sou uma Selfie !!")
    }

}

class Documento: Imprivivel {
    func imprimir() {
        print("Sou um documento Word!! ")
    }
}

class Impressora {
    var listaImprimivel: [Imprivivel] = []
    public func imprimirTudo () -> Void {
        for value in listaImprimivel {
            value.imprimir()
        }
    }
    
    public func agregarImprimivel(umImprimivel: Imprivivel) -> Void {
        self.listaImprimivel.append(umImprimivel)
    }
    
}

var contrato1: Contrato = Contrato()
var foto1: Foto = Foto()
var documento1: Documento = Documento()
var impressora1 = Impressora()
impressora1.agregarImprimivel(umImprimivel: contrato1)
impressora1.agregarImprimivel(umImprimivel: foto1)
impressora1.agregarImprimivel(umImprimivel: documento1)
//impressora1.imprimirTudo()

var pato1: Pato = Pato()
var aviao1: Aviao = Aviao()
var superhomem1: SuperHomem = SuperHomem()

var torre1: TorreDeControle = TorreDeControle()
torre1.adicionarVoador(umVoador: pato1)
torre1.adicionarVoador(umVoador: aviao1)
torre1.adicionarVoador(umVoador: superhomem1)
torre1.vemTodos()
