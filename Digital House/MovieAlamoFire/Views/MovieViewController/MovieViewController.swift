//
//  MovieViewController.swift
//  MovieAlamoFire
//
//  Created by Giuliano Accorsi on 24/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var movieCollectionView: UICollectionView!
    var dataProvider = MovieProvider()
    @IBOutlet weak var viewLoading: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        self.dataProvider.delegate = self
        
        dataProvider.getMovie()
    }


}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else{return UICollectionViewCell()}
        cell.prepareMovie(movie: dataProvider.loadMovie(index: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == dataProvider.numberOfRows() - 1 ) {
            print("Fim")
            dataProvider.getMovie()

        }
    }
    
}

extension MovieViewController: MovieProviderDelegate {
    func sucess() {
        print("Deu Bom!")
        movieCollectionView.reloadData()
    }
    
    func failed() {
        print("Failed")
    }
    
    
}
