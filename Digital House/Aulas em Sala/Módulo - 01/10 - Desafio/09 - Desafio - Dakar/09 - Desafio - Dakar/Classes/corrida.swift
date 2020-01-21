//
//  corrida.swift
//  09 - Desafio
//
//  Created by Giuliano Accorsi on 30/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Corrida {
    var distancia: Float
    var premioEmDolares: Float
    var nome: String
    var quantidadeDeCompetidoresPermitidos: Int
    var listaCompetidor: [Competidor]
    var socorristaCarro: SocorristaCarro = SocorristaCarro()
    var socorristaMoto: SocorristaMoto = SocorristaMoto()
    
    init(distancia: Float, premioEmDolares: Float, nome: String, quantidadeDeCompetidoresPermitidos: Int, listaCompetidor: [Competidor]) {
        self.distancia = distancia
        self.premioEmDolares = premioEmDolares
        self.nome = nome
        self.quantidadeDeCompetidoresPermitidos = quantidadeDeCompetidoresPermitidos
        self.listaCompetidor = listaCompetidor
    }
    
    public func adicionar(velocidade: Int, aceleracao: Int, giro: Int, placa: String, tipo: Veiculo) {
        
        let contador = self.listaCompetidor.count
        if contador <= self.quantidadeDeCompetidoresPermitidos {
            let competidor: Competidor = Competidor(velocidade: velocidade, aceleracao: aceleracao, giro: giro, placa: placa, tipo: tipo)
            self.listaCompetidor.append(competidor)
            print("Competidor Adicionado")
        }else {
            print("Não temos mais vagas par a esta corrida")
        }
        
    }
    
    public func eliminarCompetidor(competidor: Competidor) {
        if self.listaCompetidor.count > 0 {
            let index = listaCompetidor.firstIndex(where: {$0 === competidor})
            if let index2 = index {
                self.listaCompetidor.remove(at: index2)
                print("O corredor \(competidor.placa) foi removido")
            }
        }else {
            print("Não existe competidor")
        }
    }
    
    public func eliminarCompetidorComPlaca(placa: String) {
        if self.listaCompetidor.count > 0 {
            self.listaCompetidor = self.listaCompetidor.filter({$0.placa != placa})
            print("Corredor eliminado com sucesso")
        }
    }
    
    public func oGanhador() -> Competidor? {
        return listaCompetidor.randomElement()
    }
    
    func socorrer(umaPlaca: String) -> Void {
        let socorrido = self.listaCompetidor.filter({$0.placa == umaPlaca}).first
        if socorrido != nil {
            print("Socorrendo: \(socorrido!.placa)")
        }else {
            print("Competidor não encontrado, por favor informe a placa correta")
        }
    }
    
    
}
