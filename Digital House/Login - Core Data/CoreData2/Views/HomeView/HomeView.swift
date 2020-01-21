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
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var labelAviso: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    let controller:LoginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 30
        labelAviso.text = ""
        controller.loadData()
        
       
    }
    
    @IBAction func logarButton(_ sender: Any) {
        if controller.isAdmin(email: emailTF.text ?? "") {
            controller.logarUser(login: emailTF.text ?? "", password: passwordTF.text ?? "") { (success, message)  in
                if success {
                    guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "AdminView") as? AdminView else {return}
                    self.navigationController?.pushViewController(viewController, animated: true)
                    return
                    
                }else {
                    labelAviso.text = message
                }
            }
        }else {
            controller.logarUser(login: emailTF.text ?? "", password: passwordTF.text ?? "") { (success, message) in
                if success {
                    
                    guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginView") as? LoginView else {return}
                    viewController.controller = controller
                    self.navigationController?.pushViewController(viewController, animated: true)
                    return
                }else {
                    labelAviso.text = message
                }
            }
            
        }

    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterView") as? RegisterView else {return}
        
        self.navigationController?.pushViewController(viewController, animated: true)
 
    }
    

    
}
