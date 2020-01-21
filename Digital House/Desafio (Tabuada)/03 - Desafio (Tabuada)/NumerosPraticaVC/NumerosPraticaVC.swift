
//
//  NumerosPraticaVC.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 27/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class NumeroPraticaVC: UIViewController {
    var index: Int = 0
    @IBOutlet weak var numeroEscolhido: UILabel!
    @IBOutlet weak var numeroMultiplicador: UILabel!
    @IBOutlet weak var numeroTF: UITextField!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelAviso: UILabel!
    @IBOutlet weak var labelIgual: UILabel!
    
    @IBOutlet weak var labelX: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        numeroEscolhido.text = String(Estudo.shared.getNumero()!)
        numeroMultiplicador.text = "0"
        labelAviso.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.index = 0
        Estudo.shared.removerLista()
    }
    

    @IBAction func nextButton(_ sender: UIButton) {
        print(Estudo.shared.limiteNumero!)
        print(Estudo.shared.limiteNumero!)
        print(Estudo.shared.listaResultado)
        atualizaLabel(userAnswers: numeroTF)
    }
    

    
    func atualizaLabel(userAnswers: UITextField) {
        
        let listaResultado = Estudo.shared.listaResultado
        
        if let userAnswers = Int(userAnswers.text!) {
            while self.index < listaResultado.count {
                if userAnswers != listaResultado[self.index] {
                    labelAviso.text = "Errou !"
                    break
                } else if userAnswers == listaResultado[index] {
                    self.index += 1
                    numeroMultiplicador.text = String(index)
                    labelAviso.text = "Acertou !!"
                    break
                }
            }
            
            if listaResultado.count == self.index {
                esconderTudo()
                labelAviso.text = "Parabéns !!! Você conseguiu"
            }
        } else {
            labelAviso.text = "Insira um número"
        }
    }
    
    func esconderTudo() {
        numeroEscolhido.isHidden = true
        numeroMultiplicador.isHidden = true
        numeroTF.isHidden = true
        labelX.isHidden = true
        labelIgual.isHidden = true
        buttonNext.isHidden = true
    }
}
