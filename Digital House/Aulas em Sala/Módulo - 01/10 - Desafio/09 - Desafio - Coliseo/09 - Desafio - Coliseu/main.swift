//
//  main.swift
//  09 - Desafio - Coliseo
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

var coliseu: Coliseu = Coliseu()


coliseu.adicionarGladiador(gladiador: Gladiador(nome: "Giuliano", vida: 100, ataque: 20, defesa: 20))
coliseu.adicionarGladiador(gladiador: Gladiador(nome: "Felipe", vida: 100, ataque: 10, defesa: 10))

coliseu.adicionarTreinador(umTreinador: Treinador(nome: "Lazaro", porcentagemAumento: 50))
coliseu.adicionarTreinador(umTreinador: Treinador(nome: "Alexandre", porcentagemAumento: 50))

coliseu.comecarPreTemporada()


coliseu.adicionarVendedor(vendedor: Vendedor(nome: "Pedro", listaProduto: [Produto(nome: .agua, preco: 10), Produto(nome: .cocacola, preco: 5)]))
coliseu.adicionarVendedor(vendedor: Vendedor(nome: "Mauro", listaProduto: [Produto(nome: .pipoca, preco: 7 ), Produto(nome: .refri, preco: 3)]))


coliseu.listaVendedor[0].venderProduto(nomeProduto: .agua)


coliseu.registroVendas()
