//
//  main.swift
//  encapsulamento
//
//  Created by Digital House on 18/04/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import Foundation

class Uber {
    private var nome: String
    private var cpf: Int
    private var placaCarro: String
    private var saldoConta: Float
    
    init(nome: String, cpf: Int, placaCarro: String, saldoConta: Float) {
        self.nome = nome
        self.cpf = cpf
        self.placaCarro = placaCarro
        self.saldoConta = saldoConta
    }
    
    func viajar (tipo: Int, valor: Float) {
        switch tipo {
        case 1:
            self.calcularViagemX(valor: valor)
        case 2:
            self.calculaViagemPool(valor: valor)
        case 3:
            self.calculaViagemBlack(valor: valor)
            
        default:
            break
        }
    }
    
    private func calcularViagemX (valor: Float) {
        self.saldoConta = valor - (valor * 0.25)
    }
    
    private func calculaViagemPool (valor: Float) {
        self.saldoConta = valor - (valor * 0.10)
        
    }
    
    private func calculaViagemBlack (valor: Float) {
        self.saldoConta = valor
        
    }
    
    private func calculaViagemPremio (valor: Float) {
        self.saldoConta = valor * valor
    }
    
    func getSaldo() -> Float {
        return self.saldoConta
    }
    
}

enum TipoPeca {
    case terno, vestido, bone
}

class VendedorLoja {
    private var nome: String
    private var idade: Int
    private var cpf: Int
    private(set) var saldoConta: Float
    
    init(nome: String, idade: Int, cpf: Int, saldoConta: Float) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoConta = saldoConta
    }
    
    private func  calcularTerno(quantidade: Int) {
        
        switch quantidade {
        case 1,2:
            self.saldoConta  +=  Float(quantidade * 400)
        default:
            let desconto = (quantidade * 400) / 2
            self.saldoConta += Float(desconto)
        }
    }
    
    private func calcularVestido (quantidade: Int){
        if quantidade >= 5 {
            self.saldoConta += Float(quantidade) * 900
            print("Voce ganhou um veu")
        }
        
        self.saldoConta += Float(quantidade) * 900
        
    }
    
    private func calcularBone (quantidade: Int){
        switch quantidade {
        case 1...4:
            self.saldoConta += Float(quantidade) * 50
        default:
            self.saldoConta += (Float(quantidade) * 50) * 0.10
        }
    }
    
    func vender(quantidadesPecas: Int, tipoDePeca: TipoPeca) {
        switch tipoDePeca {
        case .terno:
            calcularTerno(quantidade: quantidadesPecas)
        case .vestido:
            calcularVestido(quantidade: quantidadesPecas)
        case .bone:
            calcularBone(quantidade: quantidadesPecas)
        
        }
    }
    
//    func obterSaldo () -> Float{
//        return self.saldoConta
//    }
}

var lazaro: VendedorLoja = VendedorLoja(nome: "Lazaro", idade: 24, cpf: 38226676843, saldoConta: 0)
lazaro.vender(quantidadesPecas: 3, tipoDePeca: .bone)
print(lazaro.saldoConta)
