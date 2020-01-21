//
//  MonumentoCell.swift
//  Desafio - Navigation Bandeiras
//
//  Created by Giuliano Accorsi on 04/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MonumentoCell: UITableViewCell {
    @IBOutlet weak var imagemMonumento: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(monumento: Monumento) {
        self.imagemMonumento.image = UIImage(named: monumento.nomeImagem)
    }

}
