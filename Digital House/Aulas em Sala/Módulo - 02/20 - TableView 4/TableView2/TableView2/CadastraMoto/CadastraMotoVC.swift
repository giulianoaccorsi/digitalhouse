//
//  CadastraMotoVC.swift
//  TableView2
//
//  Created by Giuliano Accorsi on 25/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class CadastraMotoVC: UIViewController {
    @IBOutlet weak var modeloTF: UITextField!
    @IBOutlet weak var precoTF: UITextField!
    @IBOutlet weak var tipoSegmentControl: UISegmentedControl!
    @IBOutlet weak var motosTableView: UITableView!
    @IBOutlet weak var imagemMoto: UILabel!
    var tipoSelecionado:String?
    var imagensMoto:[String] = ["moto1","moto2","moto3","moto4"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipoSegmentControl.selectedSegmentIndex = -1
        self.motosTableView.dataSource = self
        self.motosTableView.delegate = self

    }
    

    @IBAction func voltarButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func cadastrarButton(_ sender: Any) {
        let moto = Moto(tipo: self.tipoSelecionado(indice: tipoSegmentControl.selectedSegmentIndex), modelo: modeloTF.text!, nomeImagem: imagemMoto.text!, preco: Float(precoTF.text!)!)
        VeiculoManager.shared.adicionaVeiculo(veiculo: moto)
        print(VeiculoManager.shared.retornarMotos().count)
        self.dismiss(animated: true)
    }
    
    private func tipoSelecionado(indice: Int) -> String {
        switch indice {
        case 0:
            return "Automática"
        case 1:
            return "Manual"
        default:
            return "default"
        }
    }


}

extension CadastraMotoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imagensMoto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "motoCell", for: indexPath)
        
        cell.textLabel?.text = self.imagensMoto[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.imagemMoto.text = self.imagensMoto[indexPath.row]
    }
    
    
}
