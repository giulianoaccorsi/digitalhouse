//
//  main.swift
//  09 - Desafio - Dakar
//
//  Created by Giuliano Accorsi on 09/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation


var corridaMaluca: Corrida = Corrida(distancia: 3, premioEmDolares: 300, nome: "Corrida Maluca", quantidadeDeCompetidoresPermitidos: 10, listaCompetidor: [])


corridaMaluca.adicionar(velocidade: 30, aceleracao: 100, giro: 50, placa: "EPQ2602", tipo: Carro())
corridaMaluca.adicionar(velocidade: 50, aceleracao: 200, giro: 50, placa: "HSA3210", tipo: Moto())
corridaMaluca.adicionar(velocidade: 100, aceleracao: 300, giro: 50, placa: "DKL0930", tipo: Carro())
corridaMaluca.adicionar(velocidade: 150, aceleracao: 400, giro: 50, placa: "GDH3939", tipo: Carro())
corridaMaluca.adicionar(velocidade: 350, aceleracao: 500, giro: 50, placa: "AAA000", tipo: Moto())

//corridaMaluca.eliminarCompetidor(competidor: corridaMaluca.listaCompetidor[1])
//corridaMaluca.eliminarCompetidorComPlaca(placa: "AAA000")
//corridaMaluca.oGanhador()!.placa
//corridaMaluca.socorrer(umaPlaca: "EPQ2020")
//corridaMaluca.socorristaCarro.socorrer(umCompetidor: corridaMaluca.listaCompetidor[1])
