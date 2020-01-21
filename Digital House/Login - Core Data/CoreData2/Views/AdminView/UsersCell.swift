//
//  UsersCell.swift
//  CoreData2
//
//  Created by Giuliano Accorsi on 22/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class UsersCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        emailLabel.text = ""
        passwordLabel.text = ""
        
    }

    func prepareCell(email: String, password: String) {
        emailLabel.text = email
        passwordLabel.text = password
    }
    
}
