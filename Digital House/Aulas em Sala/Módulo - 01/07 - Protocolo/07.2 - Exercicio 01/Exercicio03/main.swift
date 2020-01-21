//
//  main.swift
//  Exercicio03
//
//  Created by Giuliano Accorsi on 24/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation


protocol Explodivel {
    func explodir()
}

protocol Gritavel {
    func gritar()
}


class Convidado: Gritavel {

    
    var nome: String
    var email: String
    
    init(nome: String, email: String) {
        self.nome = nome
        self.email = email
    }
    
    func gritar() {
    }

}

class ConvidadoDigital: Convidado {
    override func gritar() {
        print("Viva o Silvioooo !! ")
    }
}

class ConvidadoNormal: Convidado {
    override func gritar() {
        print("Não vou gritar, sou comportado e nao retardado")
    }
}


class FogoDeArtificioNormal: Explodivel {
    func explodir() {
        print("TCHACAAAABUMMMMM")
    }
}

class PackDeFogoDeArtificio: Explodivel {
    var listaFogoArtificio: [FogoDeArtificioNormal]
    init(listaFogoArtificio: [FogoDeArtificioNormal]) {
        self.listaFogoArtificio = listaFogoArtificio
    }
    func explodir() {
        for i in listaFogoArtificio {
            i.explodir()
        }
    }
}

class EventoSilvio {
    var listaTotal: [Convidado] = []
    var listaFogos: [Explodivel] = []
    
    func adicionaConvidade(umConvidado: Convidado) {
        listaTotal.append(umConvidado)
    }
    
    func silvioSopraVela () {
        for value in listaFogos {
            value.explodir()
        }
        
        for convidados in listaTotal {
            convidados.gritar()
        }
    }
        
}

var fogo1: FogoDeArtificioNormal = FogoDeArtificioNormal()
var fogo2: FogoDeArtificioNormal = FogoDeArtificioNormal()
var fogo3: FogoDeArtificioNormal = FogoDeArtificioNormal()
var fogo4: FogoDeArtificioNormal = FogoDeArtificioNormal()


var convidado1: Convidado = ConvidadoDigital(nome: "Giuliano", email: "a@a.com")
var convidado2: Convidado = ConvidadoDigital(nome: "Adriano", email: "a@a.com")
var convidado3: Convidado = ConvidadoDigital(nome: "Lene", email: "a@a.com")
var convidado4: Convidado = ConvidadoNormal(nome: "Azul", email: "a@a.com")
var convidado5: Convidado = ConvidadoNormal(nome: "Matheus", email: "a@a.com")
var convidado6: Convidado = ConvidadoNormal(nome: "Lazaro", email: "a@a.com")
var convidado7: Convidado = ConvidadoDigital(nome: "Thiago", email: "a@a.com")

var eventoSilvio: EventoSilvio = EventoSilvio()
eventoSilvio.adicionaConvidade(umConvidado: convidado1)
eventoSilvio.adicionaConvidade(umConvidado: convidado2)
eventoSilvio.adicionaConvidade(umConvidado: convidado3)
eventoSilvio.adicionaConvidade(umConvidado: convidado4)
eventoSilvio.adicionaConvidade(umConvidado: convidado5)
eventoSilvio.adicionaConvidade(umConvidado: convidado6)
eventoSilvio.adicionaConvidade(umConvidado: convidado7)

eventoSilvio.listaFogos.append(fogo1)
eventoSilvio.listaFogos.append(fogo2)
eventoSilvio.listaFogos.append(fogo3)

var packFogo: PackDeFogoDeArtificio = PackDeFogoDeArtificio(listaFogoArtificio: [fogo1,fogo2,fogo3,fogo4])
eventoSilvio.listaFogos.append(packFogo)

eventoSilvio.silvioSopraVela()


