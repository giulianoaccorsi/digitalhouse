//
//  ViewController.swift
//  ColletionView
//
//  Created by Giuliano Accorsi on 04/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {
    var arrayNomes:[String] = ["Felipe", "Patricia", "Natalia", "Lazaro", "Julia", "Euclides", "Alessandra"]
    @IBOutlet weak var myCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Delegates
        self.myCollection.delegate = self
        self.myCollection.dataSource = self
        
        self.myCollection.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        
    }
    
    
}

extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayNomes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCell
        
        cell.setup(name: self.arrayNomes[indexPath.row], imagem: "")
        
        return cell
    }
    
    
}
