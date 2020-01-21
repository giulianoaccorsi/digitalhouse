//
//  CarroCell.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 21/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class CarroCell: UITableViewCell {
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var nameCar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(nome: String, imagem: String) {
        self.nameCar.text = nome
        self.carImage.image = UIImage(named: imagem)
    }
    
    func configCarro (carro: Carro) {
        self.carImage.image = UIImage(named: carro.nomeImagem)
        self.nameCar.text = carro.nome
    }
}
