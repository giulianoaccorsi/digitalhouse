//
//  main.swift
//  08 - Patterns
//
//  Created by Giuliano Accorsi on 27/04/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

// ***************************** DELEGATE *************************************************************************

protocol Entregavel {
    func jornalRecebido()
}

class Assinante: Entregavel {
    var nome: String?
    
    init(nome: String?) {
        self.nome = nome
    }
    
    func jornalRecebido() {
        print("Você recebbeu um jornal")
    }
}

class Pessoa: Assinante {
    var rg: String?
    var endereco: String?
    
    init(nome: String?, rg: String?, endereco: String?) {
        self.rg = rg
        self.endereco = endereco
        super.init(nome: nome)
    }
    
    override func jornalRecebido() {
        print("Muito obrigado, Vocês são demais !!")
    }
}

class Empresa: Assinante {
    var cnpj: String?
    var nmrFunc: Int?
    
    init(nome: String?, cnpj: String?, nmrFunc: Int?) {
        self.cnpj = cnpj
        self.nmrFunc = nmrFunc
        super.init(nome: nome)
    }
    
    override func jornalRecebido() {
        print("Agradecemos cordialmente pela excelência dos serviços prestados")
    }
    
}

class Jornal {
    private var delegate: [Entregavel]
    
    init(delegate: [Entregavel]) {
        self.delegate = delegate
    }
    
    func entregarJornal() {
        for value in delegate {
            value.jornalRecebido()
        }
    }
}

var lazaro: Assinante = Pessoa(nome: "Lazaro", rg: "23612813821", endereco: "rua")
var digitalhouse: Assinante = Empresa(nome: "Digital house", cnpj: "32131", nmrFunc: 20)

var jornal1: Jornal = Jornal(delegate: [lazaro, digitalhouse])
jornal1.entregarJornal()


// *********************** CLOSURES **********************************************************************


