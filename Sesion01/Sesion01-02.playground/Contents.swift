import UIKit

var nombreOpcional: String?
nombreOpcional = "Kenyi"
nombreOpcional = nil

//************************************************************

let nombreServicio: String? = nil
print(nombreServicio ?? "Ocurrio un error con el nombre")

let precioTelevisor: Float? = 10.3
let precioComputadora: Float? = nil

let precioFinal = (precioTelevisor ?? 0.0) + (precioComputadora ?? 0.0)
print(precioFinal)


let promedioAlumno: Float? = nil

//Si promedioAlumno es nulo, entonces mostar mensaje de error.. de lo contrario, sumar 2 puntos y mostrar el promedio final


//Con if let
//Crea una variable segura en un nuevo contexto

func validarConIfLet() {
    
    if let promedioSeguro = promedioAlumno {
        let nuevoPromedio = promedioSeguro + 2
        print(nuevoPromedio)
    }else{
        print("Error en el promedio if let")
    }
}


//Con guard let
//Crea una varible segura en el contexto actual

func validarConGuardLet() {
    
    guard let notaSegura = promedioAlumno else {
        print("Error en el promedio guard let")
        return
    }
    
    let nuevoPromedio = notaSegura + 2
    print(nuevoPromedio)
}


validarConIfLet()






//if promedioAlumno == nil {
//    print("Mensaje de error")
//}else{
//    print(promedioAlumno + 2)
//}
