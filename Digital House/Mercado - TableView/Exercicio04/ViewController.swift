//
//  ViewController.swift
//  Exercicio04
//
//  Created by Giuliano Accorsi on 07/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var teste: UIView!
    @IBOutlet weak var nomeProduto: UITextField!
    @IBOutlet weak var precoProduto: UITextField!
    @IBOutlet weak var labelQuantidade: UILabel!
    @IBOutlet weak var labelValorTotal: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonAdd: UIButton!
    var giuRestaurante: Restaurante = Restaurante()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeProduto.becomeFirstResponder()                              // Abrir Teclado quando clicar
        precoProduto.becomeFirstResponder()                             // Abrir Teclado quando clicar
        precoProduto.keyboardType = UIKeyboardType.decimalPad          // Abrir teclado numerico
        labelQuantidade.text = String(Int(stepper.value))               // Deixar o Label do Stepper Int
        buttonAdd.layer.cornerRadius = 10                               // Arredondar
        teste.layer.cornerRadius = 10                                   // Arredondar
        tableView.layer.cornerRadius = 10                               // Arredondar
        
        do {
            if let decoded = UserDefaults.standard.data(forKey: "listaProdutos"), let produtos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? [Produto] {
                giuRestaurante.listaProdutos = produtos
                giuRestaurante.devolverPrecoTotal(lista: produtos)
                tableView.reloadData()
                atualizarPrecoTotal()
            }
        } catch { print("Deu ruim") }
        
        
        // Do any additional setup after loading the view.
    }
    
    func atualizarPrecoTotal() {
        labelValorTotal.text = "R$ " + String(giuRestaurante.precoTotal)
    }
    
    
    
    @IBAction func adicionarProduto(_ sender: UIButton) {
        if nomeProduto.hasText && precoProduto.hasText {
            if let pegaValor = precoProduto.text {
                let novoValor = Float(pegaValor)
                
                let produto: Produto = Produto(nomeProduto: nomeProduto.text!, precoProduto: novoValor!, qtdProduto: Float(stepper!.value))
                giuRestaurante.listaProdutos.append(produto)
            }
        }
        
        giuRestaurante.devolverPrecoTotal(lista: giuRestaurante.listaProdutos)
        atualizarPrecoTotal()
        tableView.reloadData()
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: giuRestaurante.listaProdutos, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "listaProdutos")
        } catch {
            print("Deu ruim ao salvar")
        }
        
    }
    
    
    @IBAction func aumentarProduto(_ sender: UIStepper){
        self.labelQuantidade.text = String(Int(sender.value))
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var lista: [String] = []
        let index = indexPath.row as Int
        
        for produto in giuRestaurante.listaProdutos {
            lista.append("\(produto.nomeProduto) - R$\(produto.precoProduto) x \(produto.qtdProduto) = R$ \(produto.precoProduto * produto.qtdProduto)")
        }
        cell.textLabel?.text = String(describing: lista[index])
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giuRestaurante.listaProdutos.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            giuRestaurante.removerProduto(produtoRemovido: giuRestaurante.listaProdutos[indexPath.row])
            giuRestaurante.listaProdutos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            tableView.reloadData()
            atualizarPrecoTotal()
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: giuRestaurante.listaProdutos, requiringSecureCoding: false)
                UserDefaults.standard.set(data, forKey: "listaProdutos")
            } catch {
                print("Deu ruim ao salvar")
            }
        }
    }
    
}


