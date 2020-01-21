//
//  Coliseo.swift
//  09 - Desafio - Coliseo
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Coliseu {
    private var listaGladiadores:[Gladiador] = []
    private var listaTreinador: [Treinador] = []
    private(set) var listaVendedor: [Vendedor] = []
    private var listaRegistroInterno: [[Registro]] = []
    
    
    public func adicionarVendedor(vendedor: Vendedor) -> Void {
        self.listaVendedor.append(vendedor)
    }
    
    public func adicionarGladiador(gladiador: Gladiador) -> Void {
        self.listaGladiadores.append(gladiador)
    }
    
    public func adicionarTreinador(umTreinador: Treinador) -> Void {
        self.listaTreinador.append(umTreinador)
    }
    
    public func comecarPreTemporada () -> Void {
        if self.listaTreinador.count != self.listaGladiadores.count {
            print("O número de gladiadores precisa ser igual ao número de treinadores para começar a temporada !!")
        }else {
            for (indexTreinador,treinador) in self.listaTreinador.enumerated() {
                for (indexGladiador,gladiador) in self.listaGladiadores.enumerated() {
                    if indexTreinador == indexGladiador {
                        let aumento = (treinador.porcentagemAumento / 100) + 1
                        gladiador.ataque *= aumento
                        gladiador.defesa *= aumento
                        
                    }
                }
                
            }
        }
    }
    
    public func eliminarGladiador(nome: String) -> Void {
        if self.listaGladiadores.count != 0 {
            self.listaGladiadores = listaGladiadores.filter({$0.nome != nome})
        }else {
            print("Lista de Gladiores está vazia")
        }
    }
    
    public func registroVendas() -> Void {
        
        for vendas in listaVendedor {
            self.listaRegistroInterno.append(vendas.listaVendas)
            self.listaVendedor.removeAll()
        }
        
    }
}


