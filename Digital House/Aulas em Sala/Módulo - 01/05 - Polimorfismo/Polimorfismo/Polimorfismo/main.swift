//
//  main.swift
//  Polimorfismo
//
//  Created by Giuliano Accorsi on 16/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Funcionario {
    var nome: String
    var salario: Float
    var cpf: Int
    
    
    init(nome: String, salario: Float, cpf: Int) {
        self.nome = nome
        self.salario = salario
        self.cpf = cpf
    }
    
    func receberBonus() -> Float {
        return salario * 0.15
        
        
    }
    
}

class Programador: Funcionario {
    var plataformaTrabalho: String
    
    init(plataformaTrabalho: String, nome: String, salario: Float, cpf: Int) {
        self.plataformaTrabalho = plataformaTrabalho
        super.init(nome: nome, salario: salario, cpf: cpf)
    }
    
    override func receberBonus() -> Float {
        return self.salario * 0.20
    }
}

class Designer: Funcionario{
    
    var ferramentaPreferida: String
    init(ferramentaPreferida: String, nome: String, salario: Float, cpf: Int) {
        self.ferramentaPreferida = ferramentaPreferida
        super.init(nome: nome, salario: salario, cpf: cpf)
    }
    
    override func receberBonus() -> Float {
        return self.salario * 0.15
    }
    
}

class Veiculo {
    var cor: String
    var preco: Float
    var qtdPassageiro: Int
    
    init(cor: String, preco: Float, qtdPassageiro: Int) {
        self.cor = cor
        self.preco = preco
        self.qtdPassageiro = qtdPassageiro
    }
    
    func calculaKM (distancia: Float) -> Float {
        return Float(self.qtdPassageiro) * distancia
    }
}

class Carro: Veiculo {
    var tamanhoRodas: Int
    init(tamanhoRodas: Int, cor: String, preco: Float, qtdPassageiro: Int) {
        self.tamanhoRodas = tamanhoRodas
        super.init(cor: cor, preco: preco, qtdPassageiro: qtdPassageiro)
    }
    
    override func calculaKM(distancia: Float) -> Float {
        return Float(self.tamanhoRodas) * Float(self.qtdPassageiro) * distancia
    }
}

class Aviao: Veiculo {
    var piloto: String
    var companhiaArea: String
    
    init(piloto: String, companhiaArea: String, cor: String, preco: Float, qtdPassageiro: Int) {
        self.piloto = piloto
        self.companhiaArea = companhiaArea
        super.init(cor: cor, preco: preco, qtdPassageiro: qtdPassageiro)
    }
    
}
