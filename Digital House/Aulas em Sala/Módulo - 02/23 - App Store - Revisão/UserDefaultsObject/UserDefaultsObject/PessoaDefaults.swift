//
//  PessoaDefaults.swift
//  UserDefaultsObject
//
//  Created by Digital House on 01/06/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import Foundation

class PessoaDefaults {
    
    private static let pessoaKey = "pessoa"

    static func salvaPessoa(pessoa: Pessoa) {
        do {
        let pessoaData = try JSONEncoder().encode(pessoa)
            UserDefaults.standard.set(pessoaData, forKey: pessoaKey)
        } catch {
            print(error)
            return
        }
    }
    
    static func buscaPessoa() -> Pessoa {
        
        do {
            guard let pessoaData = UserDefaults.standard.data(forKey: pessoaKey) else { fatalError() }
            let pessoa = try JSONDecoder().decode(Pessoa.self, from: pessoaData)
            return pessoa
        } catch {
            fatalError()
        }
    }
    
}
