//
//  ViewController.swift
//  Exercicio03
//
//  Created by Giuliano Accorsi on 07/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let teste: Calculo = Calculo()
    @IBOutlet weak var dinheiroTotal: UILabel!
    @IBOutlet weak var labelPorcentagem: UILabel!
    @IBOutlet weak var totalGorgeta: UILabel!
    @IBOutlet weak var quantidadePessoas: UILabel!
    @IBOutlet weak var totalPrecoDividido: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func mudarValor(_ sender: UISlider) {
        let porcentagemLabel: Float = teste.calculaGorgeta(dinheiro: sender.value, porcentagem: teste.porcentagem)
        self.dinheiroTotal.text = "$ " + String(sender.value)
        self.totalGorgeta.text = "$ " + String(porcentagemLabel)
        self.totalPrecoDividido.text = "$ " + String((porcentagemLabel + sender.value)/2)
    }
    
    @IBAction func mudarPorcentagem(_ sender: UIStepper) {
        teste.porcentagem = Float(sender.value)
        self.labelPorcentagem.text = String(sender.value) + " %"
    }
    @IBAction func aumentarPessoa(_ sender: UIStepper) {
        teste.pessoas = Int(sender.value)
        self.quantidadePessoas.text = "Pessoas: \(sender.value)"
    }
    
}

