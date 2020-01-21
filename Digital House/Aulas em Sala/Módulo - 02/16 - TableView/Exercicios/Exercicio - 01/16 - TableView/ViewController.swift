//
//  ViewController.swift
//  16 - TableView
//
//  Created by Giuliano Accorsi on 14/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

enum veiculo: Int {
    case carro = 0
    case moto = 1
}

class ViewController: UITableViewController {
    
    let arrayCarros: [String] = ["Honda", "Toyota", "Ferrari", "Volkswagen", "Nissan"]
    let arrayMotos: [String] = ["Bravax", "Ducati", "Harley-Davidson", "Kawasaki"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Carros"
        }else {
            return "Motos"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayCarros.count
        }else {
            return arrayMotos.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celular", for: indexPath)
        
        switch indexPath.section {
        case veiculo.carro.rawValue:
            cell.textLabel?.text = self.arrayCarros[indexPath.row]
        case veiculo.moto.rawValue:
            cell.textLabel?.text = self.arrayMotos[indexPath.row]
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Clicou no \(self.arrayCarros[indexPath.row])")
        }else {
           print("Clicou na \(self.arrayMotos[indexPath.row])")
        }
    }
}





