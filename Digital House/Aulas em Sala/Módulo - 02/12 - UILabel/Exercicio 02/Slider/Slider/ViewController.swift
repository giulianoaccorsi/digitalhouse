//
//  ViewController.swift
//  Slider
//
//  Created by Giuliano Accorsi on 06/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var temperaturaFixa: UISegmentedControl!
    @IBOutlet weak var labelCelsius: UILabel!
    @IBOutlet weak var labelFahrenheit: UILabel!
    @IBOutlet weak var labelKelvin: UILabel!
    
    
    var valortemperatura: Temperatura = Temperatura()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcularTemperatura(_ sender: UISlider) {
        
        valortemperatura.calcularTempetura(valor: sender.value, tipo: TipoTemperatura(rawValue: temperaturaFixa.selectedSegmentIndex ) ?? TipoTemperatura.celsius)
        
        
        self.labelCelsius.text = String(valortemperatura.celsius)
        self.labelFahrenheit.text = String(valortemperatura.fahrenheit)
        self.labelKelvin.text = String(valortemperatura.kelvin)
      
    }
    

}


