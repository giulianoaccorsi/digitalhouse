//
//  ThirdViewController.swift
//  database
//
//  Created by Nadilson Santana on 03/08/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import UIKit
import FirebaseDatabase
import ZVProgressHUD

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var lblInformation: UILabel!
    
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendInformation(_ sender: Any) {
        let ref = Database.database().reference()
        
        let postObject =  ["address": addressTextField.text ?? "",
                           "name": nameTextField.text ?? "" ]
        ZVProgressHUD.show()

        ref.child("user/profile").child(nameTextField.text ?? "").setValue(postObject) { (error, ref) in
            ZVProgressHUD.dismiss()

            if error == nil {
                print("successo")
            } else {
                print("deu ruim")
            }
        }
    }
    
    @IBAction func loadInformation(_ sender: Any) {
        let user = Database.database().reference().child("user/profile/\(nameTextField.text ?? "")")
        ZVProgressHUD.show()
        user.observe(.value) { (userInformation) in
            if let dictUser = userInformation.value as? [String:Any] {
                ZVProgressHUD.dismiss()
                self.lblInformation.text = "seu nome eh: \(dictUser["name"] as! String) e seu address eh: \(dictUser["address"] as! String)"
            }
        }
    }
}
