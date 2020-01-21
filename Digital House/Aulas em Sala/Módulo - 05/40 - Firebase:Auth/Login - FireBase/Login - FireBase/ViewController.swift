//
//  ViewController.swift
//  Login - FireBase
//
//  Created by Giuliano Accorsi on 30/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        Auth.auth().createUser(withEmail: "giuliano@gmail.com", password: "123456") { (authResult, error) in
//            if authResult != nil {
//                print(" *************Deu certo.. criamos o usuário *************************")
//            }else{
//                print("Deu ruimmm")
//            }
//        }
        
        Auth.auth().signIn(withEmail: "giuliano@gmail.com", password: "123456") { [weak self] user, error in
            guard let strongSelf = self else {return}
            if user != nil {
                print("deu certo! Logamos \(user)")
            }else {
                print("deu ruim! Error: \(error)" )
            }
            
        }
    }


}

