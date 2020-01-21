//
//  ViewController.swift
//  Desafio - Compras
//
//  Created by Giuliano Accorsi on 25/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewProduct: UITableView!
    
    let mp = MarketPlaceController()
    
    var nomeProduto: String?
    var qtdProduto: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        tableViewProduct.register(nib, forCellReuseIdentifier: "ProductCell")
        tableViewProduct.reloadData()
     
    }

    @IBAction func butonAddProduct(_ sender: Any) {
        let alert = UIAlertController(title: "Adicionar Produto", message: "Digite o Produto que deseja adicionar", preferredStyle: .alert)
        
        alert.addTextField { (textfieldNome) in
            textfieldNome.delegate = self
            textfieldNome.placeholder = "Nome Produto"
            
        }
        alert.addTextField { (textfieldQTD) in
            textfieldQTD.placeholder = "Quantidade Produto"
        }
        
        let actionDone = UIAlertAction(title: "Adicionar", style: .default) { (addProduto) in
            print("Adicionou")
        }
        
        let actionCancel = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alert.addAction(actionDone)
        alert.addAction(actionCancel)
        
        self.present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mp.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return UITableViewCell()}
        cell.prepareCell(product: mp.getProduct(index:  indexPath))
        return cell
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
}
