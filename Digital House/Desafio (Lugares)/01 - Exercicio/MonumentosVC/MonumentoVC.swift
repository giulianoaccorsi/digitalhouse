//
//  MonumentoVC.swift
//  01 - Exercicio
//
//  Created by Giuliano Accorsi on 22/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class MonumentoVC: UITableViewController {
    var arrayMonumentos: [Monumento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayMonumentos = [
            Monumento(nomeMonumento: "Torre Eiffel", nomePais: "França", imagemMain: "torre01", imagemMaior: "torre02", imagemBandeira: "torre03"),
            Monumento(nomeMonumento: "Estatua da Liberdade", nomePais: "Estados Unidos", imagemMain: "estatua01", imagemMaior: "estatua02", imagemBandeira: "estatua03"),
            Monumento(nomeMonumento: "Coliseu", nomePais: "Itália", imagemMain: "coliseu01", imagemMaior: "coliseu02", imagemBandeira: "coliseu03"),
            Monumento(nomeMonumento: "Big Ben", nomePais: "Inglaterra", imagemMain: "bigben01", imagemMaior: "bigben02", imagemBandeira: "bigben03"),
            Monumento(nomeMonumento: "Angkor Wat", nomePais: "Camboja", imagemMain: "wat01", imagemMaior: "wat02", imagemBandeira: "wat03"),
            Monumento(nomeMonumento: "Basílica de São Pedro", nomePais: "Cidade do Vaticano ", imagemMain: "basilica01", imagemMaior: "basilica02", imagemBandeira: "basilica03"),
            Monumento(nomeMonumento: "Machu Picchu", nomePais: "Peru", imagemMain: "machu01", imagemMaior: "machu02", imagemBandeira: "machu03"),
            Monumento(nomeMonumento: "Taj Mahal", nomePais: "Índia", imagemMain: "tag01", imagemMaior: "tag02", imagemBandeira: "tag03"),
            Monumento(nomeMonumento: "Cristo Redentor", nomePais: "Brazil", imagemMain: "cristo01", imagemMaior: "cristo02", imagemBandeira: "cristo03")
        ]
        self.tableView.register(UINib(nibName: "MonumentoCell", bundle: nil), forCellReuseIdentifier: "MonumentoCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMonumentos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MonumentoCell = tableView.dequeueReusableCell(withIdentifier: "MonumentoCell", for: indexPath) as! MonumentoCell
        cell.configCellMonumento(monumento: arrayMonumentos[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let monumentoSelecionado = arrayMonumentos[indexPath.row]
        self.performSegue(withIdentifier: "DetailVC", sender: monumentoSelecionado)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewcontroller: DetailVC? = segue.destination as? DetailVC
        if let _viewcontroller = viewcontroller {
            _viewcontroller.monumento = sender as? Monumento
        }
    }
    
    
    
}

