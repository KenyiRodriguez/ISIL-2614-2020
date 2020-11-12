//
//  PlacesViewController.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 11/5/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesViewController: UIViewController {
    
    var arrayPlaces = [PlaceBE]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL San Isidro",
                                        address: "Av. Faustino Sánchez Carrión 285, San Isidro 15076",
                                        urlImage: "",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.0938308, longitude: -77.0551838)))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL Miraflores",
                                        address: "Av. Alfredo Benavides 778, Cercado de Lima 15074",
                                        urlImage: "",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.1254227, longitude: -77.027025)))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL La Molina",
                                        address: "Av. la Fontana 955, La Molina 15024",
                                        urlImage: "",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.073370, longitude: -76.948071)))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? MapViewController {
            controller.objPlace = sender as? PlaceBE
        }
    }
    
}


//Se encarga de llenar la tabla
extension PlacesViewController: UITableViewDataSource { //number, number, cellfor
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cellIdentidier = "PlaceTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier, for: indexPath) as! PlaceTableViewCell
        cell.objPlace = self.arrayPlaces[indexPath.row]
        
        return cell
    }
}

//Se encarga de notificar los eventos del usuario en la tabla
extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objPlace = self.arrayPlaces[indexPath.row]
        self.performSegue(withIdentifier: "MapViewController", sender: objPlace)
    }
    
}
