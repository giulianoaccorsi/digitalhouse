//
//  ViewController.swift
//  30 - ActionSheat
//
//  Created by Giuliano Accorsi on 25/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var labelAviso: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
    }
    
    var valorSalvo: String?

    
    
    
    
    
    
    
    
    
    
    
    // ----------- UI ALERT --------------------------

    @IBAction func uiAlert(_ sender: Any) {
        let alerta = UIAlertController(title: "Alerta TOP", message: "Hello World", preferredStyle: .alert)
        
        let btnOkay = UIAlertAction(title: "LabelTOP", style: .default) { (mudou) in
            self.labelAviso.text = "CLICOOOOU"
            return
        }
        
        let btnCancel = UIAlertAction(title: "Cancel", style: .destructive) { (cancelou) in
            
            self.labelAviso.text = self.valorSalvo
        }
        
        alerta.addAction(btnOkay)
        alerta.addAction(btnCancel)
        alerta.addTextField { (textfield) in
            textfield.delegate = self
            self.labelAviso.text = textfield.text
            
        }
        self.present(alerta, animated: true, completion: nil)

    }
    
    
    
        // ----------- UI SHEAT --------------------------
    
    @IBAction func uiSheat(_ sender: Any) {
        let actionSheat = UIAlertController(title: "Alerta TOP", message: "Hello World", preferredStyle: .actionSheet)
        
        let btnOkay = UIAlertAction(title: "LabelTOP", style: .default) { (mudou) in
            self.labelAviso.text = "CLICOOOOU 2"
            return
        }
        
        let btnCancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        actionSheat.addAction(btnOkay)
        actionSheat.addAction(btnCancel)
        self.present(actionSheat, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        valorSalvo = textField.text
    }
    
}

