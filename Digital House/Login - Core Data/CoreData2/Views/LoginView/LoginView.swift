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

    var controller: LoginController?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let userObtido = controller?.getUser().name {
            userLabel.text = userObtido
        }

    }
    
    @IBAction func noButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func yesButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterView") as? RegisterView else {return}
        viewController.controller = controller
        viewController.isUpdatingUser = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
