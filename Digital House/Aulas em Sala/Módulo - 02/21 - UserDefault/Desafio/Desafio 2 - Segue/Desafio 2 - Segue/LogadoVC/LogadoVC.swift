//
//  ViewLogin.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 18/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class LogadoVC: UIViewController {
    @IBOutlet weak var labelCongratz: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 10

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.layer.insertSublayer(GradientColor.setGradientBackground(frame: view.bounds), at:0)
    }
    @IBAction func backToPage(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
}
