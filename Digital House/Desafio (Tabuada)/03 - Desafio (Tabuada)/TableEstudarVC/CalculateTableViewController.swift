//
//  CalculateViewController.swift
//  03 - Desafio (Tabuada)
//
//  Created by Giuliano Accorsi on 23/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class CalculateTableViewController: UITableViewController {
    var estudo: Estudo?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Estudo.shared.removerLista()
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Estudo.shared.returnCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numerosCell", for: indexPath)
        Estudo.shared.mostrarResultadosTV()
        cell.textLabel?.text = Estudo.shared.listarResultados(index: indexPath.row)
        

        return cell
    }

}

