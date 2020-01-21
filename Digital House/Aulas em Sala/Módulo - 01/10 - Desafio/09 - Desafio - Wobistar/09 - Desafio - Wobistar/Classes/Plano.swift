//
//  Plano.swift
//  09 - Desafio - Wobistar
//
//  Created by Giuliano Accorsi on 06/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
enum Plano {
    case comunidadeEI, eiTWO, eiONE
}

class PlanoEI {
    public var tarifa: [Plano:Float] = [Plano.comunidadeEI:0.5,
                                 Plano.eiTWO:0.3,
                                 Plano.eiONE:0]
    
    public func obterTarifa(tipoPlano: Plano) -> Float {
        return self.tarifa[tipoPlano]!
    }
}
