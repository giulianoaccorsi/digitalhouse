//
//  SecondViewController.swift
//  database
//
//  Created by Nadilson Santana on 03/08/19.
//  Copyright © 2019 Digital House. All rights reserved.
//

import UIKit
import Alamofire
import ZVProgressHUD
import ProgressHUDSwift

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("name1")
        print("name2")
        print("name3")
        printName()
        print("name4")
        alamofire()
        print("name5")
        print("name6")
        
    }
    
    func printName(){
        print("nomeDaFuncao")
    }

    func alamofire() {
        ZVProgressHUD.show()

        Alamofire.request("https://api.imgflip.com/get_memes", method: .get).responseJSON { response in
        

            if response.response?.statusCode == 200 {
                print("successo")
            } else {
                print("fail")
            }
            ZVProgressHUD.dismiss()

        }
    }
    
    @IBAction func button(_ sender: Any) {
        print("oi")
    }
    

}
