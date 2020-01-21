//
//  MenuColletion.swift
//  23 - App Store - Revisão
//
//  Created by Giuliano Accorsi on 05/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MenuColletion: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configurarNome(titulo: String) {
        self.labelName.text = titulo
    }
    
    func hideView() {
        view.isHidden = true
    }
    
}
