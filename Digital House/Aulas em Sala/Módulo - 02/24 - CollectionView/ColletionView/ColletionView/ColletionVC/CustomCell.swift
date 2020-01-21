//
//  CustomCell.swift
//  ColletionView
//
//  Created by Giuliano Accorsi on 04/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(name: String, imagem: String) {
        self.imagem.image = UIImage(named: imagem)
        self.nomeLabel.text = name
    }

}
