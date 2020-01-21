//
//  UIImage + URL.swift
//  NetworkAdvanced
//
//  Created by Giuliano Accorsi on 13/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
extension UIImage {
    
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        self.init(data: imageData)
    }
    
}
