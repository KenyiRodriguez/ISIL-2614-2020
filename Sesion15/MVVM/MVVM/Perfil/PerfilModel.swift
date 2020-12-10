//
//  PerfilModel.swift
//  MVVM
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Persona = (_ objPersona: PersonaBE) -> Void

class PerfilModel {
    
    class func obtenerPerfil(_ success: @escaping Persona) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            success(PersonaBE(nombre: "Kenyi", apellido: "Rodriguez"))
        }
    }
}
