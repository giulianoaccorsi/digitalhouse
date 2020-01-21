//
//  ViewController.swift
//  01 - Exercicio
//
//  Created by Giuliano Accorsi on 22/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var monumento: Monumento?
    @IBOutlet weak var labelPais: UILabel!
    @IBOutlet weak var imageBandeira: UIImageView!
    @IBOutlet weak var imageShow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _monumento = monumento {
            self.labelPais.text = _monumento.nomePais
            self.imageBandeira.image = UIImage(named: _monumento.imagemBandeira)
            self.imageShow.image = UIImage(named: _monumento.imagemMaior)
        }
    }
    
}

