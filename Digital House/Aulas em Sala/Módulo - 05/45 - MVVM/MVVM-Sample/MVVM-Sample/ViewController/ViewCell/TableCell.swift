//
//  TableCell.swift
//  MVVM-Sample
//
//  Created by Giuliano Accorsi on 13/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var labelNome: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(meme: MemeElement) {
        labelNome.text = meme.name
    }

}
