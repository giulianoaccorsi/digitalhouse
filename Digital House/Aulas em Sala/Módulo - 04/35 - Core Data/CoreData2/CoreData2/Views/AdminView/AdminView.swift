//
//  AdminView.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 19/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit


class AdminView: UIViewController {
    
    var controller = LoginController()

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "UsersCell", bundle: nil)
        usersTableView.register(nib, forCellReuseIdentifier: "UsersCell")
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.reloadData()

 
    }
    



}

extension AdminView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getArrayUser().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for: indexPath) as? UsersCell else { return UITableViewCell()}
        cell.prepareCell(email: controller.getEmail(index: indexPath), password: controller.getPassword(index: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            controller.deleteUser(index: indexPath)
            tableView.reloadData()
            controller.loadData()
        }
    }
    
    
}
