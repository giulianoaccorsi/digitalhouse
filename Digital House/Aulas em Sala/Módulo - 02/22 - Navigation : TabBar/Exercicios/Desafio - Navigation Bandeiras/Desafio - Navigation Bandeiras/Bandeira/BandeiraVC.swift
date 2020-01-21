//
//  Bandeira.swift
//  Desafio - Navigation Bandeiras
//
//  Created by Giuliano Accorsi on 03/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class BandeiraVC: UIViewController {
    var monumento: Monumento?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let monumentoObtido = monumento {
            self.label.text = monumentoObtido.nomePais
            self.imagem.image = UIImage(named: monumentoObtido.nomeBandeira) 
        }
    }

}
