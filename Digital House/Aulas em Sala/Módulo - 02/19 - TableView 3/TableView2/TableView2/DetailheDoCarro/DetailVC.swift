//
//  DetailVC.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 21/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var carro: Carro?

    @IBOutlet weak var imagemCarro: UIImageView!
    
    @IBOutlet weak var nomeCarro: UILabel!
    @IBOutlet weak var anoCarro: UILabel!
    @IBOutlet weak var kmCarro: UILabel!
    @IBOutlet weak var precoCarro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _carro = carro {
            
            imagemCarro.image = UIImage(named: _carro.nomeImagem)
            nomeCarro.text = "Nome do Carro: " + _carro.nome
            anoCarro.text = "Ano do Carro: " + String(_carro.ano)
            kmCarro.text = "Kilometragem: " + String(_carro.km)
            precoCarro.text = "Preco Carro: " + String(_carro.preco)
        }
    }

    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
