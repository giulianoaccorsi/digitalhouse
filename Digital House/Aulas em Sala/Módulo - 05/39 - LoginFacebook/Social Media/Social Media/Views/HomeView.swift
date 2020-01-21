//
//  ViewController.swift
//  Social Media
//
//  Created by Giuliano Accorsi on 27/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn



class HomeView: UIViewController {
    @IBOutlet weak var loginButton: FBLoginButton!
    
    @IBOutlet weak var google: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        loginButton.delegate = self
        
        
    }
    
    func getInformation() {
        GraphRequest(graphPath: "/me", parameters: ["fields":"name, email, gender, address"]).start { (connection, result, error) in
            if let dict = result as? [String:Any] {
                print(dict)
            }
        }
    }
    @IBAction func googleSignIn(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
    }
    

}


extension HomeView: LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Deslogou")
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if result?.isCancelled ?? true {
            print("Cancelou")
            return
        }else {
            getInformation()
        }
    }
}

extension HomeView: GIDSignInUIDelegate {
    
    
}
