//
//  ViewController.swift
//  Aula17 - Segues
//
//  Created by Giuliano Accorsi on 16/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nome: String?
    @IBOutlet weak var labelTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load Laranja")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWill Appear Laranja")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWill Disappear Laranja")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewWill Did Appear Laranja")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewWill Did Disappear Laranja")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irParaViewControllerVerde" {
            guard let viewControllerVerde = segue.destination as? ViewControllerVerde else {return}
            guard let nomeSender = sender as? String else {return}
            viewControllerVerde.nome = nomeSender
            
        }
    }
    @IBAction func irParaTelaAmarela(_ sender: UIButton) {
        performSegue(withIdentifier: "irParaViewControllerVerde", sender: labelTexto.text)
    }
}
    
    



