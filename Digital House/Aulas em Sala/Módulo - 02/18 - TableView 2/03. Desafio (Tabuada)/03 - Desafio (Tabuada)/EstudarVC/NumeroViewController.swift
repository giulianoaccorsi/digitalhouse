//
//  NumeroViewController.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 23/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class NumeroViewController: UIViewController {
    @IBOutlet weak var calcularButton: UIButton!
    @IBOutlet weak var numeroTF: UITextField!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.calcularButton.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcularButton(_ sender: UIButton) {
        let numeroToInt = Int(self.numeroTF.text!)
        if numeroToInt != nil {
            
            Estudo.shared.calcularTabuada(numeroEscolhido: numeroToInt!, limiteNumero: 20)
            performSegue(withIdentifier: "CalculateTableViewController", sender: .none)
            
        }
    }
 

}
