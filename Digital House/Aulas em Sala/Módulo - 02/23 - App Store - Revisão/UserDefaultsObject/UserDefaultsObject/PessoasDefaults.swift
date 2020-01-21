//
//  PessoasDefaults.swift
//  UserDefaultsObject
//
//  Created by Digital House on 01/06/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import Foundation

class PessoasDefaults {
    
    private static let pessoasKey: String = "pessoas"
    
    static func save(pessoa: Pessoa) {
        do {
            var pessoas: [Pessoa] = getPessoas()
            pessoas.append(pessoa)
            let pessoasData = try JSONEncoder().encode(pessoas)
            UserDefaults.standard.set(pessoasData, forKey: pessoasKey)
        } catch {
            return
        }
    }
    
    static func getPessoas() -> [Pessoa] {
        do {
            guard let pessoasData = UserDefaults.standard.data(forKey: pessoasKey) else { return [] }
            let pessoas: [Pessoa] = try JSONDecoder().decode([Pessoa].self, from: pessoasData)
            return pessoas
        } catch { return [] }
    }
    
}
