//
//  Gradient.swift
//  Desafio - TableView
//
//  Created by Giuliano Accorsi on 15/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class GradientColor {
    static func setGradientBackground(frame: CGRect) -> CAGradientLayer {
        let colorTop =  UIColor(red: 194.0/255.0, green: 229.0/255.0, blue: 156.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 179.0/255.0, blue: 244.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = frame
        return gradientLayer
    }
}
