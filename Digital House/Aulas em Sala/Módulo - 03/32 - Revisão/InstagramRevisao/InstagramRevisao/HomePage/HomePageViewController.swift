//
//  ViewController.swift
//  InstagramRevisao
//
//  Created by Giuliano Accorsi on 02/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataProvider = HomePageDataProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "InstagramCell", bundle: nil), forCellWithReuseIdentifier: "InstagramCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.dataProvider.delegate = self
        dataProvider.addMedia(media: Media(title: "Paisagem TOP", comments: "Que Paisagem Linda", image: "paisage"))
        dataProvider.addMedia(media: Media(title: "Paisagem TOP", comments: "Que Paisagem Linda", image: "paisage"))
        dataProvider.addMedia(media: Media(title: "Paisagem TOP", comments: "Que Paisagem Linda", image: "paisage"))
        dataProvider.addMedia(media: Media(title: "Paisagem TOP", comments: "Que Paisagem Linda", image: "paisage"))
        dataProvider.addMedia(media: Media(title: "Paisagem TOP", comments: "Que Paisagem Linda", image: "paisage"))
        dataProvider.addMedia(media: Media(title: "Paisagem TOP", comments: "Que Paisagem Linda", image: "paisage"))
        
    }


}


extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: InstagramCell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstagramCell", for: indexPath) as? InstagramCell else{return UICollectionViewCell()}
        
        cell.setupCell(media: dataProvider.getMovie(index: indexPath))
        return cell
    }
        
    
}

extension HomePageViewController: HomePageDataProviderDelegate {
    func success() {
        collectionView.reloadData()
    }
    
    func failure() {
        print("Não Carregou Nada")
    }
    
    
}
