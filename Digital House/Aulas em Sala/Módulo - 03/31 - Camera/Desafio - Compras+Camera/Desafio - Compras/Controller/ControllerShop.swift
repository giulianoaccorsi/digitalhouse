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
    
    private var nome: String?
    private var qtd: Int?
    
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
    
    func setNome(nome: String?) {
        self.nome = nome ?? ""
    }
    func setQtd(qtd: Int?) {
        self.qtd = qtd ?? 0
    }
    
    func createProdut() -> Product{
        let product = Product(nomeProduto: self.nome ?? "", qtdProduto: self.qtd ?? 0)
        return product
    }
}
