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
    
    @IBOutlet weak var tblPlaces: UITableView!
    
    var arrayPlaces = [PlaceBE]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL San Isidro",
                                        address: "Av. Faustino Sánchez Carrión 285, San Isidro 15076",
                                        urlImage: "https://anarixefotografia.files.wordpress.com/2013/06/sabado-1.jpg",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.0938308, longitude: -77.0551838)))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL Miraflores",
                                        address: "Av. Alfredo Benavides 778, Cercado de Lima 15074",
                                        urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSjkal86yeWQf5At6aPB0qPIxonKwceBcK3CQ&usqp=CAU",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.1254227, longitude: -77.027025)))
        
        self.arrayPlaces.append(PlaceBE(name: "ISIL La Molina",
                                        address: "Av. la Fontana 955, La Molina 15024",
                                        urlImage: "https://isil.pe/wp-content/uploads/2018/12/home-bg-isil.jpg",
                                        coordinate: CLLocationCoordinate2D(latitude: -12.073370, longitude: -76.948071)))
    }
    
    func deletePlace(_ place: PlaceBE) {
        
        self.showAlert(title: "ISIL", message: "¿Deseas eliminar esta sede?", acceptButton: "Aceptar", cancelButton: "Cancelar", pressAccept: {
            
            guard let index = self.arrayPlaces.firstIndex(where: {
                        $0.place_coordinate.latitude == place.place_coordinate.latitude &&
                        $0.place_coordinate.longitude == place.place_coordinate.longitude
            }) else {
                return
            }
            
            self.arrayPlaces.remove(at: index)
            
            let indexPath = IndexPath(row: index, section: 0)
            self.tblPlaces.deleteRows(at: [indexPath], with: .right)
            
        }, pressCancel: nil)
    }
    
    func seeInformation(_ indexPath: IndexPath) {
        let objPlace = self.arrayPlaces[indexPath.row]
        self.performSegue(withIdentifier: "MapViewController", sender: objPlace)
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
        cell.delegate = self
        cell.objPlace = self.arrayPlaces[indexPath.row]
        
        return cell
    }
}

extension PlacesViewController: PlaceTableViewCellDelegate {
    
    func placeTableViewCell(_ cell: PlaceTableViewCell, deletePlace objPlace: PlaceBE) {
        self.deletePlace(objPlace)
    }
}

//Se encarga de notificar los eventos del usuario en la tabla
extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.seeInformation(indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { (_, _, _) in
            let objPlace = self.arrayPlaces[indexPath.row]
            self.deletePlace(objPlace)
        }
        
        let seeAction = UIContextualAction(style: .normal, title: "Ver Detalle") { (_, _, _) in
            self.seeInformation(indexPath)
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, seeAction])
        return swipeActions
    }
    
}
