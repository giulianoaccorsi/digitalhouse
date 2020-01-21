//
//  DetailView.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 15/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    var meme: MemeElement?
    var controller = MemeController()
    var arrayTextField:[UITextField] = []
    var dicMensagem:[Int:String] = [:]
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var imageMeme: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStackView()
        
        backButton.layer.cornerRadius = 10
        postButton.layer.cornerRadius = 10
        if let memeObtido = meme {
            do {
                imageMeme.image = try UIImage(withContentsOfUrl: memeObtido.url)
            }catch {
                print("Erro ao carregar a imagem Detail")
            }
            
            
        }
        
    }
    
    func loadStackView() {
        
        guard let boxCount = meme?.boxCount else {return}
        var arrayFields:[UITextField] = []
        
        for value in 0..<boxCount {
            let textFieldTeste = UITextField()
            textFieldTeste.tag = value
            textFieldTeste.borderStyle = .line
            textFieldTeste.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            arrayFields.append(textFieldTeste)
        }
        
        self.arrayTextField.append(contentsOf: arrayFields)
        
        let stackView = UIStackView(arrangedSubviews: arrayFields)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: imageMeme.bottomAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: postButton.topAnchor, constant: -50).isActive = true
    }
    

    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func postarButton(_ sender: Any) {
        guard let memeSelecionado = meme?.id else{return}
        controller.generateMeme(templateId: memeSelecionado, arrayBox: controller.getAllTextFields(textfields: arrayTextField)) { (success) in
            if success {
                let aviso = UIAlertController(title: "FUNCIONOOOOU", message: "BOA CARAI", preferredStyle: .alert)
                let btnOkay = UIAlertAction(title: "oKAY", style: .default)
                aviso.addAction(btnOkay)
                self.present(aviso, animated: true)
            }
        }
        
    }
        
}
