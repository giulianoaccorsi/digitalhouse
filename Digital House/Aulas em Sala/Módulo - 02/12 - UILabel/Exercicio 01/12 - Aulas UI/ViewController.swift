//
//  ViewController.swift
//  12 - Aulas UI
//
//  Created by Giuliano Accorsi on 04/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonRed: UIButton!
    @IBOutlet weak var buttonGreen: UIButton!
    @IBOutlet weak var buttonBlue: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func pintarPlano(plano: UIButton) {
//        if plano.tag == 0 {
//            self.view.backgroundColor = .red
//        } else if plano.tag == 1 {
//            self.view.backgroundColor = .green
//        } else {
//            self.view.backgroundColor = .blue
//        }
//
//    }
    
    @IBAction func pintarPlano(plano: UIButton) {
        switch plano {
        case buttonRed:
            self.view.backgroundColor = .red
        case buttonGreen:
            self.view.backgroundColor = .green
        case buttonBlue:
            self.view.backgroundColor = .blue
        default:
            break
        }
        
    }

    
   
}

