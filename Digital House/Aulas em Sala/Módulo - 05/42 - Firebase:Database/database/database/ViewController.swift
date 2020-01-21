//
//  ViewController.swift
//  database
//
//  Created by Digital House on 02/08/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ViewController: UIViewController {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lblText: UILabel!
    
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        // Do any additional setup after loading the view.
        
    
    }
    
    @IBAction func setInfo(_ sender: Any) {
        
        let ref = Database.database().reference()
        
        let postObject = ["address": addressTextField.text!,"telefone": phoneTextField.text!]
        
        ref.child("user/profile").childByAutoId().setValue(postObject) { (error, ref) in
            if error == nil {
                self.id = ref.key!
                print ("foi sucesso")
            } else {
                print("deu error: \(error)")
            }
        }
    }
    
    
    @IBAction func carregarInfo(_ sender: Any) {
        let user = Database.database().reference().child("user/profile/\(id!)")
        
        user.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String:Any] {
                self.lblText.text = "seu telefone é \(dict["telefone"] as! String) e seu endereço é \(dict["address"] as! String)" 
            }
        }
    }
    
    
    
    

}



