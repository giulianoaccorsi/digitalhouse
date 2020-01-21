//
//  ViewController.swift
//  33 - Networking
//
//  Created by Giuliano Accorsi on 11/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session: URLSession = URLSession.shared
        let url: URL = URL(string: "https://indian-cities-api-nocbegfhqg.now.sh/citiess")!
        
        let task: URLSessionTask = session.dataTask(with: url) { (data, response, error) in
        print("***************************************************")
        print(data)
        print("***************************************************")
        print(response)
         print("***************************************************")
        print(error)
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print(json)
//            }catch {
//                print(error.localizedDescription)
//            }
        }
        
        task.resume()
        
        
        
        
    }


}

