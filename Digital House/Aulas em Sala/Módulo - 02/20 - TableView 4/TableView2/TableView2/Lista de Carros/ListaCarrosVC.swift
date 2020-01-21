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
   
    var arrayTitles:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        carrosTableView.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        self.carrosTableView.register(UINib(nibName: "CarroCell", bundle: nil), forCellReuseIdentifier: "CarroCell")
        
    
        self.carrosTableView.delegate = self
        self.carrosTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
      self.atualizaTabela()
    }
    
    func atualizaTabela() {
        if VeiculoManager.shared.checkContainsSections() {
            self.arrayTitles = ["Motos", "Carros"]
        }
        carrosTableView.reloadData()
    }


}


extension ListaCarrosVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if self.arrayTitles.count > 0  {
            return self.arrayTitles[section]
        }
        
        return ""
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return VeiculoManager.shared.numberOfSections()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        if VeiculoManager.shared.retornarCarros().count > 0 && VeiculoManager.shared.retornarMotos().count > 0 {
            self.arrayTitles = ["Motos","Carros"]
            if section == 0 {
                return VeiculoManager.shared.retornarMotos().count
            }else {
                return VeiculoManager.shared.retornarCarros().count
            }
        }else {
            if VeiculoManager.shared.retornarMotos().count > 0 {
                self.arrayTitles = ["Motos"]
                return VeiculoManager.shared.retornarMotos().count
            }else {
                self.arrayTitles = ["Carros"]
                return VeiculoManager.shared.retornarCarros().count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: CarroCell = tableView.dequeueReusableCell(withIdentifier: "CarroCell", for: indexPath) as! CarroCell

        
        if VeiculoManager.shared.checkContainsSections() {
            
            if indexPath.section  == 0 {
                cell.configVeiculo(veiculo: VeiculoManager.shared.retornarMotos()[indexPath.row])
            }else{
                cell.configVeiculo(veiculo: VeiculoManager.shared.retornarCarros()[indexPath.row])
            }
        }else {
            
            if VeiculoManager.shared.retornarCarros().count > 0 {
                cell.configVeiculo(veiculo: VeiculoManager.shared.retornarCarros()[indexPath.row])
            }else if VeiculoManager.shared.retornarMotos().count > 0 {
                cell.configVeiculo(veiculo: VeiculoManager.shared.retornarMotos()[indexPath.row])
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let carroSelecionado = arrayVeiculo[indexPath.row]
//        self.performSegue(withIdentifier: "DetailVC", sender: carroSelecionado)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            VeiculoManager.shared.deletaCarro(index: indexPath.row)
            VeiculoManager.shared.deletaMoto(index: indexPath.row)
            atualizaTabela()
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetailVC? = segue.destination as? DetailVC
        if let _vc = vc {
            _vc.veiculo = sender as? Veiculo
        }
    }
}
