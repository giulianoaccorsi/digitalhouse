//
//  InstagramCell.swift
//  InstagramRevisao
//
//  Created by Giuliano Accorsi on 02/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class InstagramCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.cornerRadius = 19
        
    }
    
    func setupCell(media: Media) {
        self.image.image = UIImage(named: media.image ?? "")
        self.titleLabel.text = media.title ?? ""
        self.commentsLabel.text = media.comments ?? ""
    }

}
