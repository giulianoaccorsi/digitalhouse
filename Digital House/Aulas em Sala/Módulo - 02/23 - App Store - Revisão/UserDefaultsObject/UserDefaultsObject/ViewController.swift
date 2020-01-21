//
//  ViewController.swift
//  UserDefaultsObject
//
//  Created by Digital House on 01/06/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PessoasDefaults.save(pessoa: Pessoa(nome: "Lazaro", idade: 24, peso: 80, sexo: Sexo.m))
        
        PessoasDefaults.save(pessoa: Pessoa(nome: "Felipe", idade: 39, peso: 80, sexo: Sexo.m))
        
        for pessoa in PessoasDefaults.getPessoas() {
            print("\(pessoa.nome) \(pessoa.idade)")
        }
    }

}

