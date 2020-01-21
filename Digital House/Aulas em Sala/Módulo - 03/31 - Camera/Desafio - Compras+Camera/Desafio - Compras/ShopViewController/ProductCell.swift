//
//  ProductCell.swift
//  Desafio - Compras
//
//  Created by Giuliano Accorsi on 25/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var numberQTD: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepareCell(product: Product) {
        self.tituloLabel.text = product.nomeProduto
        self.numberQTD.text = String(product.qtdProduto)
        self.imageProduct.image = product.image
    }
    
}
