//
//  calculo.swift
//  Exercicio03
//
//  Created by Giuliano Accorsi on 07/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Calculo {
    var dinheiro: Float = 0
    var porcentagem: Float = 0
    var pessoas: Int = 1
    
    func calculaGorgeta (dinheiro: Float, porcentagem: Float) -> Float{
        let porcentagemTotal = porcentagem / 100
        return dinheiro * porcentagemTotal
    }
}
