//
//  ViewController.swift
//  UserDefault
//
//  Created by Giuliano Accorsi on 28/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var nomeTF: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.removeForKey(key: "Nome")
        Utils.removeForKey(key: "dicPessoa")
        Utils.dictionaryRepresentation()
        resultadoLabel.text = Utils.getStringObject(key: "Nome") ?? ""
        
        let dicPessoa:[String:Any] = ["nome":"Giuliano",
                                      "Sobrenome":"Accorsi",
                                      "Idade":"20"]
        Utils.saveDictionary(dic: dicPessoa, key: "dicPessoa")
        Utils.getDictionary(key: "dicPessoa")
    }

    @IBAction func cadastrarButton(_ sender: UIButton) {
        Utils.saveObject(key: "Nome", value: self.nomeTF.text ?? "")
    }
    @IBAction func clicouExibir(_ sender: UIButton) {
        
        if let nomeObtido = Utils.getStringObject(key: "Nome") {
            self.resultadoLabel.text = nomeObtido
        }
    }
    
}

