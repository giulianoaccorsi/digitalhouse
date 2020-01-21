//
//  ViewController.swift
//  MVVM-Sample
//
//  Created by Giuliano Accorsi on 13/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var labelBottom: UILabel!
    
    let memesViewModel = MemesViewModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        memesViewModel.getMeme { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setupUI() {
        btnPost.setTitle(memesViewModel.titleBtnPost, for: .normal)
        labelBottom.text = memesViewModel.titlePage
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memesViewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        cell.setupCell(meme: memesViewModel.getCurrentMeme(currentObject: indexPath.row))
        return cell
    }
    
    
}

