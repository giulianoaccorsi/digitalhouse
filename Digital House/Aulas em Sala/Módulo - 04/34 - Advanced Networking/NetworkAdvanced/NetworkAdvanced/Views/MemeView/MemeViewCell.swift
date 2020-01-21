//
//  MemeViewCell.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 13/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MemeViewCell: UICollectionViewCell {
    @IBOutlet weak var imageMeme: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageMeme.layer.masksToBounds = true
        imageMeme.layer.cornerRadius = 10
        
    }
    
    func cellSetup(meme: MemeElement) {
        do {
            imageMeme.image = try UIImage(withContentsOfUrl: meme.url)
        }catch {
            print("Erro ao carregar a imagem")
        }
    
    }

}
