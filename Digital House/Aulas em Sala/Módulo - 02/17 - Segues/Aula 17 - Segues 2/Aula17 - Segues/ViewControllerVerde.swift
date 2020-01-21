//
//  ViewControllerVerde.swift
//  Aula17 - Segues
//
//  Created by Giuliano Accorsi on 16/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewControllerVerde: UIViewController {
    @IBOutlet weak var labelNome: UILabel!
    var nome: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load Verde")
        self.labelNome.text = self.nome
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWill Appear Verde")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWill Disappear Verde")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewWill Did Appear Verde")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewWill Did Disappear Verde")
    }

    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
