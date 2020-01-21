//
//  ViewRegister.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 18/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var fieldLogin: UITextField!
    @IBOutlet weak var fieldSenha: UITextField!
    @IBOutlet weak var fieldNasc: UITextField!
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var labelSenha: UILabel!
    @IBOutlet weak var labelNasc: UILabel!
    @IBOutlet weak var labelAviso: UILabel!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var voltarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLogin.text = "Login"
        labelSenha.text = "Password"
        labelNasc.text = "Data de Nascimento"
        labelAviso.text = ""
        cadastrarButton.layer.cornerRadius = 10
        voltarButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.layer.insertSublayer(GradientColor.setGradientBackground(frame: view.bounds), at:0)
    }
    
    @IBAction func voltarButton(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    @IBAction func registerButton(_ sender: UIButton) {
        
        if Validacao.registerValidation(login: fieldLogin, senha: fieldSenha, dataNasc: fieldNasc, label: labelAviso) {
            DataBase.listUsers.forEach {
                if $0.login == fieldLogin.text {
                    labelAviso.text = "Usuário já existe"
                } else {
                    let usuario : User = User(login: fieldLogin.text!, password: fieldSenha.text!, dateBirth: fieldNasc.text!)
                    DataBase.listUsers.append(usuario)
                    labelAviso.text = "Usuario Cadastrado Com Sucesso"
                }
            }
            
        }
    }
    
    
    
    
    
}
