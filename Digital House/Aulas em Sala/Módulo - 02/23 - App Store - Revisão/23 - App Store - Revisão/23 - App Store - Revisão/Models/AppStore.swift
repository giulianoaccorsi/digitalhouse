//
//  Loja.swift
//  23 - App Store - Revisão
//
//  Created by Giuliano Accorsi on 05/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

class AppStore {
    private static var listaApps:[App] = []
    
    static func adicionarLista(app: App) {
        listaApps.append(app)
    }
    
    static func obterLista(categoria: Categoria) -> [App] {
        return listaApps.filter{$0.categoria == categoria}
    }
    
}


