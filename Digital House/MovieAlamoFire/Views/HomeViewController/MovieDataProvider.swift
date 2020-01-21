//
//  MovieViewController.swift
//  MovieAlamoFire
//
//  Created by Giuliano Accorsi on 02/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation

protocol MovieProviderDelegate: class {
    func sucess()
    func failed()
}

class MovieProvider {
    
    weak var delegate: MovieProviderDelegate?
    
    private var arrayMovie:[Movie] = []
    
    func numberOfRows() -> Int {
        return self.arrayMovie.count
    }
    
    func addArrayMovie(movies: [Movie]) -> Void {
        self.arrayMovie = movies
        self.delegate?.sucess()
    }
    
    func loadMovie(index: IndexPath) -> Movie {
        if arrayMovie.count <= 0 {
            return Movie(dic: [:])
        }
        return self.arrayMovie[index.item]
        
    }
    
    func getMovie() {
        MovieAPIStore().getMovies { (arrayMovie, Failed) in
            if (Failed != nil) {
                print("Deu mt ruim")
            } else {
                print("Movies Carregados :)")
                if let jsonMovie = arrayMovie {
                    self.arrayMovie.append(contentsOf: jsonMovie)
                    self.delegate?.sucess()
                }
            }
        }
    }
    
}
