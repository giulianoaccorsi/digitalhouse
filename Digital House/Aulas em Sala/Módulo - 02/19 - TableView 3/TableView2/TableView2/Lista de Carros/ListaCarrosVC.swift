//
//  ViewController.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 21/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ListaCarrosVC: UIViewController {
    @IBOutlet weak var carrosTableView: UITableView!
    
//    var audi: Carro = Carro(nome: "A4", nomeImagem: "audi", ano: 2019, km: 0, preco: 100000)
//    var bmw: Carro = Carro(nome: "X1", nomeImagem: "bmw", ano: 2018, km: 5000, preco: 120000)
//    var ferrari: Carro = Carro(nome: "F51", nomeImagem: "ferrari", ano: 2014, km: 3000, preco: 1000000000)
//    var mercedes: Carro = Carro(nome: "GLC-250", nomeImagem: "mercedes", ano: 2010, km: 9000, preco: 100000)
//    var bugatti: Carro = Carro(nome: "Divo", nomeImagem: "bugatti", ano: 2020, km: 0, preco: 1500000000)
    
    var arrayCarro: [Carro] = []
    
    
    override func viewDidLoad() {
        arrayCarro = []
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        carrosTableView.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        
        self.carrosTableView.register(UINib(nibName: "CarroCell", bundle: nil), forCellReuseIdentifier: "CarroCell")
        
    
        self.carrosTableView.delegate = self
        self.carrosTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atualizaTabela()
    }
    
    func atualizaTabela() {
        self.arrayCarro = carroManager.shared.retornarCarros()
        carrosTableView.reloadData()
    }


}


extension ListaCarrosVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCarro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CarroCell = tableView.dequeueReusableCell(withIdentifier: "CarroCell", for: indexPath) as! CarroCell
        cell.configCarro(carro: self.arrayCarro[indexPath.row])
        cell.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carroSelecionado = arrayCarro[indexPath.row]
        self.performSegue(withIdentifier: "DetailVC", sender: carroSelecionado)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carroManager.shared.deletaCarro(Index: indexPath.row)
            atualizaTabela()
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetailVC? = segue.destination as? DetailVC
        if let _vc = vc {
            _vc.carro = sender as? Carro
        }
    }
}
