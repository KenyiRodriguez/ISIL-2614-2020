//
//  ViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/29/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!

    lazy var locationManager: CLLocationManager = {
       
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.distanceFilter = 2000
        manager.delegate = self
        return manager
    }()
    
    
    func createMarkerToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinate)
        marker.icon = UIImage(named: "ic_pin")
        marker.map = self.mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true

        self.locationManager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if let userCoordinate = self.mapView.myLocation?.coordinate {
            let camera = GMSCameraPosition(target: userCoordinate, zoom: 16)
            self.mapView.animate(to: camera)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("CAMBIO DE UBICACION")
    }
}

extension ViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        self.createMarkerToCoordinate(coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        marker.map = nil //Elimina el pin del mapa
        return true //Significa que todos los pines se pueden tocar
    }
}

