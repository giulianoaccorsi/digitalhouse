//
//  Funcoes.swift
//  Slider
//
//  Created by Giuliano Accorsi on 06/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
enum TipoTemperatura:Int {
    case celsius = 0
    case fahrenheit = 1
    case kelvin = 2
    
}

class Temperatura {

    var fahrenheit: Float = 0
    var kelvin: Float = 0
    var celsius: Float = 0
    
    
    func calcularTempetura(valor: Float, tipo: TipoTemperatura) -> Void {
        switch tipo {
        case .celsius:
            self.celsius = valor
            self.fahrenheit = (self.celsius * 1.8) + 32
            self.kelvin = self.celsius + 273.15
        case .fahrenheit:
            self.fahrenheit = valor
            self.celsius = (self.fahrenheit - 32) / 1.8
            self.kelvin = (self.fahrenheit - 32) * 5/9 + 273.15
        case .kelvin:
            self.kelvin = valor
            self.celsius = self.kelvin - 273.15
            self.fahrenheit = (self.kelvin - 273.15) * 1.8 + 32
            
        }
    }
}
