//
//  DiscBE.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscBE {
    
    var name        : String
    var author      : String
    var urlImage    : String
    var releaseYear : Int
    var releaseDate : Date
    
    init(json: WebServiceManager.JSON)  {
        
        self.name           = json["nombre"] as? String ?? ""
        self.author         = json["autor"] as? String ?? ""
        self.urlImage       = json["urlImagen"] as? String ?? ""
        self.releaseYear    = json["publicacion"] as? Int ?? 0
        
        let fechaPublicacion = json["fechaPublicacion"] as? String ?? ""
        self.releaseDate = fechaPublicacion.toDateWithFormat("dd/MM/yyyy")
    }
}
