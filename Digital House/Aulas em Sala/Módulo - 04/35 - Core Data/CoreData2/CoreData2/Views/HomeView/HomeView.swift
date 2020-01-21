//
//  ViewController.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 19/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var labelAviso: UILabel!
    let controller:LoginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelAviso.text = ""
        controller.loadData()
        
       
    }
    
    @IBAction func logarButton(_ sender: Any) {
        if controller.isAdmin(email: emailTF.text ?? "") {
            print("Admin")
        }
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "AdminView") as? AdminView else {return}
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterView") as? RegisterView else {return}
        
        self.navigationController?.pushViewController(viewController, animated: true)
 
    }
    

    
}
