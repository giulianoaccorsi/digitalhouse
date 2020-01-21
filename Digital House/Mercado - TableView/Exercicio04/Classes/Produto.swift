//
//  Produto.swift
//  Exercicio04
//
//  Created by Giuliano Accorsi on 08/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class Produto: NSObject, NSCoding {
    
    
    var nomeProduto: String
    var precoProduto: Float
    var qtdProduto: Float
    
    init(nomeProduto: String, precoProduto: Float, qtdProduto: Float) {
        self.nomeProduto = nomeProduto
        self.precoProduto = precoProduto
        self.qtdProduto = qtdProduto
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nomeProduto, forKey: "nomeProduto")
        aCoder.encode(precoProduto, forKey: "precoProduto")
        aCoder.encode(qtdProduto, forKey: "qtdProduto")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let nomeProduto = aDecoder.decodeObject(forKey: "nomeProduto") as! String
        let precoProduto = aDecoder.decodeFloat(forKey: "precoProduto")
        let qtdProduto = aDecoder.decodeFloat(forKey: "qtdProduto")
        self.init(nomeProduto: nomeProduto, precoProduto: precoProduto, qtdProduto: qtdProduto)
    }
}
