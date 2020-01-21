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
    }
    
    func configVeiculo (veiculo: Veiculo) {
        self.carImage.image = UIImage(named: veiculo.nomeImagem)
        self.nameCar.text = veiculo.nome
    }
}
