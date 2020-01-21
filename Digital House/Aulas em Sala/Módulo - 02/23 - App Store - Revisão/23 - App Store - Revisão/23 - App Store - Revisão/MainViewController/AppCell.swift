//
//  AppCell.swift
//  23 - App Store - Revisão
//
//  Created by Giuliano Accorsi on 05/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

enum SO {
    case ios, android, both
}

class AppCell: UITableViewCell {
    @IBOutlet weak var imagemApp: UIImageView!
    @IBOutlet weak var nomeApp: UILabel!
    @IBOutlet weak var priceApp: UILabel!
    @IBOutlet weak var iOSimage: UIImageView!
    @IBOutlet weak var androidImage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupApp(app: App) {
        imagemApp.image = UIImage(named: app.imagem)
        nomeApp.text = app.nome
        priceApp.text = "R$ \(app.price)"
        imageSO(tipo: app.so)
    }
    
    func imageSO (tipo: SO) {
        switch tipo {
        case .android:
            iOSimage.isHidden = true
        case .ios:
            androidImage.isHidden = true
        case .both:
            return
            
        }
        
    }
}
