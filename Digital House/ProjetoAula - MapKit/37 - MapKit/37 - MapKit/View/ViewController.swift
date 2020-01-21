//
//  ViewController.swift
//  37 - MapKit
//
//  Created by Giuliano Accorsi on 23/07/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation: CLLocation = CLLocation(latitude: -23.5654197, longitude: -46.6545216)
        centerMapOnLocation(location: initialLocation)
//        let pino = Local(title: "Bar", subtitle: "Melhor Bar da Região de São Paulo", categoria: "Bar", coordinate: CLLocationCoordinate2D(latitude: -23.5525266, longitude: -46.6534113))
//        self.mapView.addAnnotation(pino)
        self.mapView.delegate = self
        mapView.addAnnotations(self.loadInitialData())
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.checkLocationAuthorizationStatus()
        
    }
    
    func centerMapOnLocation(location: CLLocation){
        let  coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func loadInitialData() -> [Local] {
        var arrayLocals:[Local] = []
        if let path = Bundle.main.path(forResource: "locals", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonResult = jsonResult as? [[String:String]] {
                    for value in jsonResult {
                        let currentLocal = Local(json: value)
                        arrayLocals.append(currentLocal)
                    }
                }
            }catch {
                
            }
        }
        return arrayLocals
    }
    
    func checkLocationAuthorizationStatus() {
        
        self.locationManger.delegate = self
        self.locationManger.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            self.mapView.showsUserLocation = true
        }else {
            self.locationManger.requestWhenInUseAuthorization()
        }
        
    }


}


extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Local else {return nil}
        let identifier: String = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            let button = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
            button.setBackgroundImage(UIImage(named: "wze"), for: .normal)
            view.rightCalloutAccessoryView = button
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = annotation.subtitle
            
            view.detailCalloutAccessoryView = detailLabel
        }
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("CLICOU NO BUTAUM")
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.checkLocationAuthorizationStatus()
    }
}
