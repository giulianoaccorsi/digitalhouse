//
//  Gradient.swift
//  Desafio 2 - Segue
//
//  Created by Giuliano Accorsi on 16/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//


import UIKit

class GradientColor {
    static func setGradientBackground(frame: CGRect) -> CAGradientLayer {
        let colorTop =  UIColor(red:0.99, green:0.27, blue:0.42, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.25, green:0.37, blue:0.98, alpha:1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = frame
        return gradientLayer
    }
}
