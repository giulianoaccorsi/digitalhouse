//
//  ViewController.swift
//  Desafio - Navigation Bandeiras
//
//  Created by Giuliano Accorsi on 03/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MonumentoVC: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
      var arrayMonumentos:[Monumento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayMonumentos = [
            Monumento(nome: "Jesus Cristo", nomePais: "Brazil", nomeImagem: "brazil", nomeBandeira: "brazil2"), Monumento(nome: "Flor", nomePais: "Argentina", nomeImagem: "argentina", nomeBandeira: "argetina2"), Monumento(nome: "Estadio", nomePais: "Croacia", nomeImagem: "croacia", nomeBandeira: "croacia2"), Monumento(nome: "Islandia", nomePais: "Islandia", nomeImagem: "islandia", nomeBandeira: "islandia2"), Monumento(nome: "Nigeria", nomePais: "Nigeria", nomeImagem: "nigeria", nomeBandeira: "nigeria2")]
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    
        
    }


}

extension MonumentoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMonumentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MonumentoCell = tableView.dequeueReusableCell(withIdentifier: "MonumentoCell", for: indexPath) as! MonumentoCell
        cell.configCell(monumento: arrayMonumentos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let monumentoSelecionado = arrayMonumentos[indexPath.row]
        self.performSegue(withIdentifier: "BandeiraVC", sender: monumentoSelecionado)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: BandeiraVC? = segue.destination as? BandeiraVC
        if let viewControllerObtida = viewController {
            viewControllerObtida.monumento = sender as? Monumento
        }
    }
   
    

    
    
}

