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

    var isUpdatingUser: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 30
        
        if isUpdatingUser {
            registerButton.setTitle("Update", for: .normal)
        }
        
        if let userObtido = controller?.getUser() {
            nameTF.text = userObtido.name
            emailTF.text = userObtido.email
            passwordTF.text = userObtido.password
            birthTF.text = userObtido.birth
        }

        labelAviso.text = ""
        
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        if controller?.getUser() == nil {
            controller?.registerUser(login: emailTF.text ?? "", password: passwordTF.text ?? "", name: nameTF.text ?? "", birth: birthTF.text ?? "", completion: { (message, success) in
                if success {
                    labelAviso.text = "Usuário cadastrado com sucesso"
                }else {
                    labelAviso.text = message
                }
            })
        }else {
            controller?.updateUserInformation(user: controller?.getUser(), login: emailTF.text ?? "", password: passwordTF.text ?? "", name: nameTF.text ?? "", birth: birthTF.text ?? "", completion: { (message,success) in
                if success {
                    controller?.loadData()
                }
            })
            
            
            
            
        }
        
        
    }
}
