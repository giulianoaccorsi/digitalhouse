//
//  RegisterView.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 19/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class RegisterView: UIViewController {
    
    var controller: LoginController?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var birthTF: UITextField!
    
    @IBOutlet weak var labelAviso: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        controller = LoginController()
        labelAviso.text = ""

  
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        controller?.registerUser(login: emailTF, password: passwordTF, name: nameTF, birth: birthTF, warningLabel: labelAviso, completion: { (sucess) in
            if sucess {
                labelAviso.text = "Usuário cadastrado com sucesso"
            }
        })
        
        
        
    }
    

}
