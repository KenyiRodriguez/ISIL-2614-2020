//
//  PerfilViewModel.swift
//  MVVM
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol PerfilViewModelDelegate {
    func perfilViewModelUpdatePerfil(_ perfilViewModel: PerfilViewModel)
}

class PerfilViewModel {
    
    var delegate: PerfilViewModelDelegate?
    
    var nombreCompleto: NSAttributedString {
        
        let atributosGenerales = NSMutableAttributedString()
        
        atributosGenerales.append(self.nombreAttributos)
        atributosGenerales.append(NSAttributedString(string: "  "))
        atributosGenerales.append(self.apellidoAtributos)
        
        return atributosGenerales
    }
    
    private var nombreAttributos: NSAttributedString {
        
        let nombre = self.objPersona?.nombre ?? ""
        
        let dicAtributos: [NSAttributedString.Key: Any] = [.font            : UIFont.boldSystemFont(ofSize: 23),
                                                           .foregroundColor : UIColor.red]
        
        let textoAtributos = NSMutableAttributedString(string: nombre, attributes: dicAtributos)
        return textoAtributos
    }
    
    
    private var apellidoAtributos: NSAttributedString {
        
        let apellido = self.objPersona?.apellido ?? ""
        
        let dicAtributos: [NSAttributedString.Key: Any] = [.font            : UIFont.boldSystemFont(ofSize: 40),
                                                           .foregroundColor : UIColor.systemBlue]
        
        let textoAtributos = NSMutableAttributedString(string: apellido, attributes: dicAtributos)
        return textoAtributos
    }
    
    private var objPersona: PersonaBE?
    
    func obtenerPerfil() {
        
        PerfilModel.obtenerPerfil { (objPersona) in
            self.objPersona = objPersona
            self.delegate?.perfilViewModelUpdatePerfil(self)
        }
    }
}
