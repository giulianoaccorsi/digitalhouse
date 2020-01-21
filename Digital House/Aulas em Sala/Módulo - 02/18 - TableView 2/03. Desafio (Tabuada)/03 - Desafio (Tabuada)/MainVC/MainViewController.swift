//
//  ViewController.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 22/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var praticarButton: UIButton!
    @IBOutlet weak var estudarButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.praticarButton.layer.cornerRadius = 10
        self.estudarButton.layer.cornerRadius = 10
    }

    @IBAction func estudarButton(_ sender: UIButton) {
        performSegue(withIdentifier: "NumeroViewController", sender: .none)
    }
    @IBAction func praticaButton(_ sender: UIButton) {
        performSegue(withIdentifier: "PraticaVC", sender: .none)
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
}

