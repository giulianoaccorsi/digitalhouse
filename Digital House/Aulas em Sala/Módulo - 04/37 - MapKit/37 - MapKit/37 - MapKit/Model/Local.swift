//
//  Local.swift
//  37 - MapKit
//
//  Created by Giuliano Accorsi on 23/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
import MapKit

class Local: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let categoria: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, categoria: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.categoria = categoria
        self.coordinate = coordinate
        super.init()
    }
    
    init(json: [String:String]) {
        self.title = json["title"]
        self.subtitle = json["subtitle"]
        self.categoria = json["categoria"]
        if let latidade = Double(json["lat"] ?? ""), let longitude = Double(json["lng"] ?? "") {
            self.coordinate = CLLocationCoordinate2D(latitude: latidade, longitude: longitude)
        }else {
           self.coordinate = CLLocationCoordinate2D()
        }
    }
    
}
