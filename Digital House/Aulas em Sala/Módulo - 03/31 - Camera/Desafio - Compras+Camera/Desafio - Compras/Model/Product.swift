//
//  Product.swift
//  Desafio - Compras
//
//  Created by Giuliano Accorsi on 25/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
class Product {
    var nomeProduto: String
    var qtdProduto: Int
    var image: UIImage?
    
    init(nomeProduto: String, qtdProduto: Int) {
        self.nomeProduto = nomeProduto
        self.qtdProduto = qtdProduto
    }
}
