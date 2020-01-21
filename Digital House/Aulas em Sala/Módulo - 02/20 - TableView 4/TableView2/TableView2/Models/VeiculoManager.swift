//
//  File.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 23/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class VeiculoManager {
    static let shared: VeiculoManager = VeiculoManager()
    private var carros: [Carro]
    private var motos: [Moto]

    
    private init() {
        self.carros = []
        self.motos = []
    }
    
    func checkContainsSections() -> Bool {
        if self.carros.count > 0 && self.motos.count > 0 {
            return true
        }

        return false
    }
    
    
    func numberOfSections() -> Int {
        
        if self.carros.count > 0 && self.motos.count > 0 {
            return 2
        }
        
        return 1
     }
    
    func adicionaVeiculo (veiculo: Veiculo) {
        if veiculo is Carro {
            carros.append(veiculo as! Carro)
        }else {
            motos.append(veiculo as! Moto)
        }
    }
    
    func retornarCarros() -> [Carro]{
        return carros
    }
    
    func deletaCarro(index: Int) {
        self.carros.remove(at: index)
    }
    
    func deletaMoto(index: Int) {
        self.motos.remove(at: index)
    }
    func retornarMotos() -> [Moto] {
        return motos
    }

}
