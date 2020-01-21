//
//  File.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 23/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class carroManager {
    static let shared: carroManager = carroManager()
    private var carros: [Carro]
    
    private init() {
        self.carros = []
    }
    
    func adicionaCarro (carro: Carro) {
        carros.append(carro)
    }
    
    func retornarCarros() -> [Carro]{
        return carros
    }
    
    func deletaCarro(Index: Int) {
        self.carros.remove(at: Index)
    }
}
