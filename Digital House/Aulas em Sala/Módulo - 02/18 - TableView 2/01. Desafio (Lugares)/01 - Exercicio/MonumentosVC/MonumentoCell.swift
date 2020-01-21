//
//  MonumentoCell.swift
//  01 - Exercicio
//
//  Created by Giuliano Accorsi on 22/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MonumentoCell: UITableViewCell {
    @IBOutlet weak var imagemMonumento: UIImageView!
    @IBOutlet weak var labelMonumento: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCellMonumento(monumento: Monumento) {
        self.imagemMonumento.image = UIImage(named: monumento.imagemMain)
        self.labelMonumento.text = monumento.nomeMonumento
    }
    
}
