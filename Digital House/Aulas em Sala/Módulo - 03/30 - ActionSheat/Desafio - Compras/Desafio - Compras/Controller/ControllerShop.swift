//
//  ControllerShop.swift
//  Desafio - Compras
//
//  Created by Giuliano Accorsi on 25/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class MarketPlaceController {
    private var listaShop:[Product] = [Product(nomeProduto: "Banana", qtdProduto: 10)]

    
    func addListaShop(product: Product) {
        listaShop.append(product)
    }
    
    func getCountArray() -> Int {
        return listaShop.count
    }
    
    func remove(index: IndexPath) {
        listaShop.remove(at: index.row)

    }
    
    func getNome(index: IndexPath) -> String {
        let nomeObtido = listaShop[index.row]
        return nomeObtido.nomeProduto
    }
    
    func getQTD(index: IndexPath) -> Int {
        let nomeObtido = listaShop[index.row]
        return nomeObtido.qtdProduto
    }
    
    func getProduct(index: IndexPath) -> Product {
        return listaShop[index.row]
    }
}
