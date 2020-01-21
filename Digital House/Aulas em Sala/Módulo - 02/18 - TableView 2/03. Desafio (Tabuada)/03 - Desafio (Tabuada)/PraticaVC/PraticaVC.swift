//
//  Praticavc.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 27/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class PraticaVC: UIViewController {
    @IBOutlet weak var numeroTF: UITextField!
    @IBOutlet weak var praticarButton: UIButton!
    @IBOutlet weak var labelButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stateDefault()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.stateDefault()
    }
    
    private func stateDefault() {
        numeroTF.text = nil
        labelButton.text = "Número"
        praticarButton.layer.cornerRadius = 10
        self.navigationController?.isNavigationBarHidden = false
        
    }
    @IBAction func praticarButton(_ sender: UIButton) {
        if let _numeroTF = Int(numeroTF.text!) {
            if let _numero = Estudo.shared.getNumero() {
                Estudo.shared.calcularTabuada(numeroEscolhido: _numero, limiteNumero: Int(numeroTF.text!)!)
                Estudo.shared.addNumeroMax(value: Int(numeroTF.text!)!)
                performSegue(withIdentifier: "NumeroPraticaVC", sender: .none)
            }else{
                labelButton.text = "Quantidade Treino"
                numeroTF.text = nil
                Estudo.shared.addNumero(value: _numeroTF)
            }
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Estudo.shared.removerNumero()
    }
}



