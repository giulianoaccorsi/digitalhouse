//
//  ViewController.swift
//  10 - Modelos de Tela
//
//  Created by Giuliano Accorsi on 02/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myLabel: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myLabel.text = "Giuliano"
        self.myLabel.textColor = .black
        self.myLabel.backgroundColor = .red
        
        
        let color: UIColor = .orange
        self.myView.frame = CGRect(x: 80, y: 80, width: 60, height: 100)
        self.myView.layer.cornerRadius = 5.0
        self.myView.layer.borderWidth = 2.0
        self.myView.layer.borderColor = color.cgColor
        
        // Do any additional setup after loading the view.
    }

    @IBAction func myButton(_ sender: UIButton) {
        
        print("Oi")
    }
    @IBAction func clicouTrocar(_ sender: Any) {
    }
    
}

