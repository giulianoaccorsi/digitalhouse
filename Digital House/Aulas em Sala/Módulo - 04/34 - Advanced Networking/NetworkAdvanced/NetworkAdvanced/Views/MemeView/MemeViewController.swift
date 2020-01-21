//
//  ViewController.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 13/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {
    
    @IBOutlet weak var collectionMemes: UICollectionView!
    var controller = MemeController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionMemes.layer.cornerRadius = 10
        collectionMemes.register(UINib(nibName: "MemeViewCell", bundle: nil), forCellWithReuseIdentifier: "MemeViewCell")
        collectionMemes.delegate = self
        collectionMemes.dataSource = self
        self.controller.delegate = self
        
        controller.getMemes()
    }
}



extension MemeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.arrayMemesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MemeViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeViewCell", for: indexPath) as? MemeViewCell
            else { return UICollectionViewCell()}
        guard let teste = controller.loadMeme(index: indexPath) else {return UICollectionViewCell()}
        cell.cellSetup(meme: teste)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memeSelecionado = controller.loadMeme(index: indexPath)
        self.performSegue(withIdentifier: "DetailView", sender: memeSelecionado)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: DetailView? = segue.destination as? DetailView
        if let viewControllerObtida = viewController {
            viewControllerObtida.meme = sender as? MemeElement
        }
    }
    
}

extension MemeViewController: MemeControllerDelegate {
    func success() {
        print("Sucesso!!")
        collectionMemes.reloadData()
    }
    
    func failure() {
         print("deu ruim!!")
    }
    
    
}
