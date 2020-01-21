//
//  Numeros.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 23/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
class Estudo {
    static let shared: Estudo = Estudo()
    private(set) var numero: Int?
    private(set) var limiteNumero: Int?
    private(set) var listaResultado: [Int] = []
    private(set) var listaString: [String] = []
    
    func removerNumero() {
        self.numero = nil
    }
    
    func addNumeroMax(value: Int) {
        self.limiteNumero = value
    }
    
    func addNumero(value: Int){
        self.numero = value
    }
    
    func getNumero() -> Int? {
        
        return  self.numero
    }
    
    
    func removerLista() {
        self.listaResultado.removeAll()
        self.listaString.removeAll()
    }
    
    func returnCount() -> Int{
        return self.listaResultado.count
    }
    
    func listarResultados(index: Int) -> String {
        return self.listaString[index]
    }
    
    func calcularTabuada(numeroEscolhido: Int, limiteNumero: Int) {
        var resultado = 0
        self.numero = numeroEscolhido
        for index in 0...limiteNumero {
            resultado = numeroEscolhido * index
            listaResultado.append(resultado)

        }
    }
    
    func mostrarResultadosTV() {
        for (index,resultado) in listaResultado.enumerated(){
            listaString.append("\(numero!) * \(index) = \(resultado)")
        }
    }
}
