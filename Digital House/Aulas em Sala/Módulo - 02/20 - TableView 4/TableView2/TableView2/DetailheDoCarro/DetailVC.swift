//
//  DetailVC.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 21/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var veiculo: Veiculo?

    @IBOutlet weak var imagemCarro: UIImageView!
    
    @IBOutlet weak var nomeCarro: UILabel!
    @IBOutlet weak var anoCarro: UILabel!
    @IBOutlet weak var kmCarro: UILabel!
    @IBOutlet weak var precoCarro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _veiculo = veiculo {
            if veiculo is Carro {
                imagemCarro.image = UIImage(named: _veiculo.nomeImagem)
                nomeCarro.text = "Nome do Carro: " + _veiculo.nome
                anoCarro.text = "Ano do Carro: " + String(_veiculo.ano)
                kmCarro.text = "Kilometragem: " + String(_veiculo.km)
                precoCarro.text = "Preco Carro: " + String(_veiculo.preco)
            }else {
                imagemCarro.image = UIImage(named: _veiculo.nomeImagem)
                nomeCarro.text = "Nome do Carro: " + _veiculo.nome
                anoCarro.text = "Ano do Carro: " + String(_veiculo.ano)
                kmCarro.text = "Kilometragem: " + String(_veiculo.km)
                precoCarro.text = "Preco Carro: " + String(_veiculo.preco)
            }
        }
    }

    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
