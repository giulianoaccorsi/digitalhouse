//
//  ViewController.swift
//  Aula17 - Segues
//
//  Created by Giuliano Accorsi on 16/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    @IBAction func irTelaVerde(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewControllerVerde = storyboard.instantiateViewController(withIdentifier: "ViewControllerverde") as? ViewControllerVerde else { return }
        self.present(viewControllerVerde, animated: true)
        
        // Não esquecer de colocar o Identifier no storyboard
        }
}
    
    



