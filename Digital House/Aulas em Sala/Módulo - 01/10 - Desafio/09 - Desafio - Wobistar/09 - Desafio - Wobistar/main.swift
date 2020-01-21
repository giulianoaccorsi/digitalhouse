//
//  main.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

var pessoa1: PessoaFisica = PessoaFisica(nome: "Giuliano", sobrenome: "Accorsi", rg: 396196767, nmrCliente: 9999, dataEntrada: "15/12/1996")
var empresa1: Cliente = Empresa(nmrCliente: 9998, dataEntrada: "15/12/1910", nomeFantasia: "Token", cnpj: 38226676843)

var linhaTelefonicaPessoa1: LinhaTelefonica = LinhaTelefonica(clienteTitular: pessoa1, numeroTelefone: 976004884, planoAssociado: .eiTWO)
linhaTelefonicaPessoa1.registrarLigacao(minutos: 60)

var linhaTelefonicaEmpresa1: LinhaTelefonica = LinhaTelefonica(clienteTitular: empresa1, numeroTelefone: 1150301190, planoAssociado: .comunidadeEI)
linhaTelefonicaEmpresa1.registrarLigacao(minutos: 60)
