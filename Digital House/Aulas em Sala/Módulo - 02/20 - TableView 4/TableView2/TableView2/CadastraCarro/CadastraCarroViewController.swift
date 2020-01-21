//
//  CadastraCarroViewController.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 23/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class CadastraCarroViewController: UIViewController {
    @IBOutlet weak var nomeTF: UITextField!
    @IBOutlet weak var anoTF: UITextField!
    @IBOutlet weak var kmTF: UITextField!
    @IBOutlet weak var precoTF: UITextField!
    @IBOutlet weak var imagensTableView: UITableView!
    @IBOutlet weak var labelCarro: UILabel!
    
    var imagensCarro:[String] = ["bmw","bugatti","audi","ferrari","mercedes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelCarro.text = ""
        self.imagensTableView.delegate = self
        self.imagensTableView.dataSource = self

       
    }
    @IBAction func voltarButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func cadastrarButton(_ sender: UIButton) {
        let carro = Carro(nome: nomeTF.text!, nomeImagem: labelCarro.text!, ano: Int(anoTF.text!)!, km: Float(kmTF.text!)!, preco: Float(precoTF.text!)!)
        VeiculoManager.shared.adicionaVeiculo(veiculo: carro)
        self.dismiss(animated: true)
        
    }
    
}

extension CadastraCarroViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imagensCarro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imagemCell", for: indexPath)
        cell.textLabel?.text = self.imagensCarro[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.labelCarro.text = self.imagensCarro[indexPath.row]
    }
 
}
