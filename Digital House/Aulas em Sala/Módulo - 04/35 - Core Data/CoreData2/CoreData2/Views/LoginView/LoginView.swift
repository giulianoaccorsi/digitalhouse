//
//  LoginView.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 19/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    var user: User?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let userObtido = user?.name {
            userLabel.text = userObtido
        }

    }
    
    @IBAction func noButton(_ sender: Any) {
    }
    
    @IBAction func yesButton(_ sender: Any) {
    }
    
}
