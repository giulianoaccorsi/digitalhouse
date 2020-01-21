//
//  DetailApp.swift
//  23 - App Store - Revisão
//
//  Created by Giuliano Accorsi on 05/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class DetailApp: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var teamDevLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var iosImage: UIImageView!
    @IBOutlet weak var androidImage: UIImageView!
    
    
    
    
    
    
    
    var app: App?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:1.00, green:0.47, blue:0.47,alpha:1.0)
        self.button.layer.cornerRadius = 10
        
        if let appRecebido = app {
            
            titleLabel.text = appRecebido.nome
            priceLabel.text = "R$ \(appRecebido.price)"
            imageSO(tipo: appRecebido.so)
            
        }
    }
    
    func imageSO (tipo: SO) {
        switch app?.so {
        case .android?:
            iosImage.isHidden = true
        case .ios?:
            androidImage.isHidden = true
        case .both?:
            return
            
        case .none:
            return
        }
        
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
