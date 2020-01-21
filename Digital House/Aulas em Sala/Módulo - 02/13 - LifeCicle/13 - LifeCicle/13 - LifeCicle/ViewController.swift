//
//  ViewController.swift
//  13 - LifeCicle
//
//  Created by Giuliano Accorsi on 07/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .red
        print("ViewWillAppear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewDidAppear")
        self.view.backgroundColor = .green
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewDidDissaper")
    }


}

