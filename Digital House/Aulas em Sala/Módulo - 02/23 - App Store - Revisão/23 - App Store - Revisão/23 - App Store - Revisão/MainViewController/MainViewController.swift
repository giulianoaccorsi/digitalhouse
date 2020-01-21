//
//  ViewController.swift
//  23 - App Store - Revisão
//
//  Created by Giuliano Accorsi on 01/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // Variaveis
    var arrayTitulos:[Categoria] = [.jogo, .educacao, .financas, .mobilidade, .fitness]
    
    var marioKartGame = App(imagem: "imagemLogo", nome: "Mario Kart", price: "30,00", so: .both, categoria: .jogo)
    var pokemonGO = App(imagem: "imagemLogo", nome: "Pokemon GO", price: "20,00", so: .ios, categoria: .fitness)
    var clashRoyale = App(imagem: "imagemLogo", nome: "Clash Royale", price: "50,00", so: .android, categoria: .mobilidade)
    var apps: [App] = []
    
    
    
    
    
    
    @IBOutlet weak var tableViewApps: UITableView!
    @IBOutlet weak var menuColletionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppStore.adicionarLista(app: marioKartGame)
        AppStore.adicionarLista(app: pokemonGO)
        AppStore.adicionarLista(app: clashRoyale)
        
        
        
        self.view.backgroundColor = UIColor(red:1.00, green:0.47, blue:0.47, alpha:1.0)
        menuColletionView.backgroundColor = UIColor(red:1.00, green:0.47, blue:0.47, alpha:1.0)
        
        
        
        
        
        // Delegates Colletion
        
        menuColletionView.delegate = self
        menuColletionView.dataSource = self
        self.menuColletionView.register(UINib(nibName: "MenuColletion", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        self.tableViewApps.register(UINib(nibName: "AppCell", bundle: nil), forCellReuseIdentifier: "AppCell")
        
        
        // Delegates TableView
        
        tableViewApps.delegate = self
        tableViewApps.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        apps = AppStore.obterLista(categoria: .jogo)
        tableViewApps.reloadData()
    }


}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitulos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MenuColletion = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuColletion
        
        cell.configurarNome(titulo: arrayTitulos[indexPath.row].rawValue)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        apps = AppStore.obterLista(categoria: arrayTitulos[indexPath.row])
        tableViewApps.reloadData()
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppCell = tableViewApps.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! AppCell
        cell.setupApp(app: apps[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appSelecionado = apps[indexPath.row]
        performSegue(withIdentifier: "DetailApp", sender: appSelecionado)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: DetailApp? = segue.destination as? DetailApp
        if let viewControllerRecebida = viewController {
            viewControllerRecebida.app = sender as? App
        }
    }
    
    
}

