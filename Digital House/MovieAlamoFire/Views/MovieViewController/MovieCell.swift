//
//  MovieCell.swift
//  MovieAlamoFire
//
//  Created by Giuliano Accorsi on 24/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func prepareMovie(movie: Movie) {
        imageMovie.downloaded(from: API.baseImageURL + API.widthImage + movie.posterPath)
        labelMovie.text = movie.title
    }

}
