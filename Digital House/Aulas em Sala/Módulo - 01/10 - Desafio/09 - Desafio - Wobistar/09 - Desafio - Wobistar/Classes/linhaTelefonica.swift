//
//  linhaTelefonica.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class LinhaTelefonica {
    private var clienteTitular: Cliente
    private var numeroTelefone: Int
    private var planoAssociado: Plano
    private var listaLigacao: [Registro] = []
    
    init(clienteTitular: Cliente, numeroTelefone: Int, planoAssociado: Plano) {
        self.clienteTitular = clienteTitular
        self.numeroTelefone = numeroTelefone
        self.planoAssociado = planoAssociado
    }
    
    func registrarLigacao(minutos: Float) -> Void {
        
        let novoRegistro: Registro = Registro(duracao: minutos, tarifa: PlanoEI().obterTarifa(tipoPlano: self.planoAssociado))
        print(novoRegistro.custo)
        self.listaLigacao.append(novoRegistro)
    }
}

