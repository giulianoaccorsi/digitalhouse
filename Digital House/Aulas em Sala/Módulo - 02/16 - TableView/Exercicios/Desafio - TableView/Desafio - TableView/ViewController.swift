//
//  ViewController.swift
//  Desafio - TableView
//
//  Created by Giuliano Accorsi on 15/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let turma: Classe = Classe()
    
    // Text Fields
    @IBOutlet weak var fieldNome: UITextField!
    @IBOutlet weak var fieldIdade: UITextField!
    @IBOutlet weak var fieldSemestre: UITextField!
    @IBOutlet weak var labelAviso: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    // Creating DatePicker and Picker
    private var datePicker: UIDatePicker?
    private var picker: UIPickerView?
    var pickerData:[String] = ["1º Semestre", "2º Semestre", "3º Semestre", "4º Semestre", "5º Semestre", "6º Semestre", "7º Semestre", "8º Semestre"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Date Picker -----------------------------------------------------------------------------------------------
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.locale = Locale(identifier: "pt-br")
        datePicker?.backgroundColor = UIColor(red: 100.0/255.0, green: 179.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        datePicker?.addTarget(self, action: #selector(ViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        
        
        // Picker ------------------------------------------------------------------------------------------------------
        picker = UIPickerView()
        picker?.backgroundColor = UIColor(red: 100.0/255.0, green: 179.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        
        // Delegates --------------------------------------------------------------------------------------------------
        self.picker?.delegate = self
        self.picker?.dataSource = self
        self.fieldNome.delegate = self
        self.fieldIdade.delegate = self
        self.fieldSemestre.delegate = self
        self.tableView.dataSource = self
        
        // Text Fields ---------------------------------------------------------------------------------------------
        fieldIdade.inputView = datePicker
        fieldSemestre.inputView = picker
        let toolbar = creatDonePicker()
        fieldSemestre.inputAccessoryView = toolbar
        fieldIdade.inputAccessoryView = toolbar
        
        // Label -------------------------------------------------------------------------------------------------
        labelAviso.text = ""
        
    }
    
    // Gesture ------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    // Gradient Background ----------------------------------------------------------------------------------------------
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layer.insertSublayer(GradientColor.setGradientBackground(frame: view.bounds), at:0)
    }
    
    // Date ---------------------------------------------------------------------------------------------
    
    
    @objc func datePickerValueChanged(sender: UIDatePicker?) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        if let picker = sender {
            fieldIdade.text = formatter.string(from: picker.date)
        }
        
    }
    
    
    //ToolBar ------------------------------------------------------------------------------------------------------------------------------
    func creatDonePicker() -> UIToolbar {
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneDatePicker))
        let btSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.hideBoard))
        
        let barAcessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        
        barAcessory.barStyle = .default
        barAcessory.barTintColor = UIColor(red: 100.0/255.0, green: 179.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        barAcessory.tintColor = .white
        barAcessory.isTranslucent = true
        barAcessory.items = [btCancel, btSpace, btDone]
        
        return barAcessory
    }
    
    @objc func doneDatePicker(){
        
        if fieldIdade.text?.isEmpty == false {
            fieldSemestre.becomeFirstResponder()
           
        }
        
        if fieldNome.text?.isEmpty == false && fieldSemestre.text?.isEmpty == false && fieldIdade.text?.isEmpty == false {
            let aluno: Aluno = Aluno(nome: fieldNome.text!, anoNascimento: fieldIdade.text!, semestre: fieldSemestre.text!)
            turma.turma.append(aluno)
            tableView.reloadData()
            self.hideBoard()
        }

    }

    @objc func hideBoard(){
        self.view.endEditing(true)
    }
    
}

//
// ------------------------------------------------------- FIM TABLE VIEW -------------------------------------------------
//

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fieldSemestre.text = pickerData[row]
    }
    
    
    
}


extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(self.fieldIdade) {
            datePickerValueChanged(sender: self.datePicker)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(self.fieldNome) {
            self.fieldIdade.becomeFirstResponder()
        }
        
        return true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return turma.turma.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alunos", for: indexPath)
        cell.textLabel?.text = String(objToString()[indexPath.row])
        return cell
    }

    func objToString () -> [String] {
        var lista:[String] = []
        for aluno in turma.turma {
            lista.append("\(aluno.nome)\t\(aluno.anoNascimento)\t\(aluno.semestre)")
        }
        return lista
    }
    
}
