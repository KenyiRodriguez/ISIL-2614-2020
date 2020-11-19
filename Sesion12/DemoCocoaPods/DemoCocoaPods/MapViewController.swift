//
//  ViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 10/29/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!

    var objPlace: PlaceBE!
    
    lazy var locationManager: CLLocationManager = {
       
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
        manager.distanceFilter = 2000
        return manager
    }()
    
    
    func createMarkerToCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinate)
        marker.icon = UIImage(named: "ic_pin")
        marker.map = self.mapView
        
        let camera = GMSCameraPosition(target: coordinate, zoom: 16)
        self.mapView.animate(to: camera)
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
        
        self.createMarkerToCoordinate(self.objPlace.place_coordinate)
    }
}

