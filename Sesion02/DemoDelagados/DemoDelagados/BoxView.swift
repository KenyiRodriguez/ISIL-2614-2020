//
//  BoxView.swift
//  DemoDelagados
//
//  Created by Kenyi Rodriguez on 9/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol AlumnoInterfaz {
    func aprenderiOS(alumno: Alumno)
    func aprenderAndroid(alumno: Alumno)
}

class Alumno {
    
    var nombre: String
    var delegado: AlumnoInterfaz?
    
    init(nombre: String) {
        self.nombre = nombre
    }
    
    func estudiar() {
        self.delegado?.aprenderiOS(alumno: self)
        self.delegado?.aprenderAndroid(alumno: self)
    }
}


class Profesor {
    
    func ensenar() {

        let josue = Alumno(nombre: "Josue")
        josue.delegado = self

        let kaori = Alumno(nombre: "Kaori")
        kaori.delegado = self
    }
}

extension Profesor: AlumnoInterfaz {
    
    func aprenderiOS(alumno: Alumno) {
        
        if alumno.nombre == "Kaori" {
            print("tomar examen A")
        }else if alumno.nombre == "Josue" {
            print("tomar examen B")
        }
        
        print("APRENDER IOS")
    }
    
    func aprenderAndroid(alumno: Alumno) {
        print("APRENDER ANDROID")
    }
}



