//
//  ViewMainn.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 18/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

enum tipoTela {
    case viewRegister
}

class ViewMainn: UIViewController {
    
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var labelSenha: UILabel!
    @IBOutlet weak var fieldLogin: UITextField!
    @IBOutlet weak var fieldSenha: UITextField!
    @IBOutlet weak var labelAviso: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLogin.text = "Login"
        labelSenha.text = "Password"
        labelAviso.text = ""
        loginButton.layer.cornerRadius = 10
        cadastrarButton.layer.cornerRadius = 10
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.layer.insertSublayer(GradientColor.setGradientBackground(frame: view.bounds), at:0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irParaTelaRegister" {
            guard let viewRegister = segue.destination as? ViewRegister else {return}
        }
    }
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "irParaTelaRegister", sender: .none)
        
    }
    @IBAction func loginButton(_ sender: UIButton) {
        if Validacao.loginValidation(login: fieldLogin, senha: fieldSenha, label: labelAviso) {
            if DataBase.listUsers.isEmpty {
                labelAviso.text = "Unregister User"
                return
            }
            
            DataBase.listUsers.forEach {
                if ($0.login == fieldLogin.text!) && fieldLogin.text! == "a@a.com" && ($0.password == fieldSenha.text!) {
                    performSegue(withIdentifier: "irParaTelaAdmin", sender: .none)
                }else if ($0.login == fieldLogin.text!) && ($0.password == fieldSenha.text!){
                    performSegue(withIdentifier: "irParaTelaLogin", sender: .none)
                }else if ($0.login == fieldLogin.text!) && ($0.password != fieldSenha.text!) {
                    labelAviso.text = "Invalid Password"
                } else {
                    labelAviso.text = "Unregister User"
                }
            }
            
        
        }
    }
}
