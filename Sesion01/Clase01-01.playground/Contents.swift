import Foundation

var edad = 18 //Mutable - Puede cambiar su valor
let nota = 11 //Inmutable - No cambia su valor

let nombre1 = "Kenyi" //Implícita
let nombre2: String = "Kenyi" //Explícita

let precio1: Float = 0.0
let precio2 = 0.0

let nombreAlumno = "Kenyi"
let apellidoAlumno = "Rodriguez"
let notaAlumno = 15.3

let nombreCompleto1 = nombreAlumno + apellidoAlumno
let nombreCompleto2 = nombreAlumno + " " + apellidoAlumno
let nombreCompleto3 = "\(nombreAlumno) \(apellidoAlumno) \(notaAlumno)"

let nombreCompleto4 = "Nombre: \(nombreAlumno)\nApellido: \(apellidoAlumno)\nNota: \(notaAlumno)"
print(nombreCompleto4)



class Alumno {
    
    var nombre      = ""
    var apellido    = ""
    var dni         = ""
    
    init(nombre: String, apellido: String, dni: String) {
        self.nombre     = nombre
        self.apellido   = apellido
        self.dni        = dni
    }
}

var arrayAlumnos = [Alumno]()

arrayAlumnos.append(Alumno(nombre: "Kenyi", apellido: "Rodriguez", dni: "87654321"))
arrayAlumnos.append(Alumno(nombre: "Alberto", apellido: "Peña", dni: "76543218"))
arrayAlumnos.append(Alumno(nombre: "Carlos", apellido: "Ramos", dni: "65432187"))
arrayAlumnos.append(Alumno(nombre: "Kaori", apellido: "Murakami", dni: "54321876"))
arrayAlumnos.append(Alumno(nombre: "Walter", apellido: "Perez", dni: "43218765"))

//for (int i = 0; i < arrayAlumnos.lentgth; i++) { //Cod }
print("\n******************************")
for objAlumno in arrayAlumnos {
    print("\(objAlumno.dni) - \(objAlumno.apellido), \(objAlumno.nombre)")
}

print("\n\n******************************")
for i in 0..<arrayAlumnos.count {
    let objAlumno = arrayAlumnos[i]
    print("\(i) - \(objAlumno.dni) - \(objAlumno.apellido), \(objAlumno.nombre)")
}


//func nombreFuncion(Desc variable: TipoDato, Desc variable: TipoDato...) -> TipoDato

//NO RECOMENDADO
func agregarAlumno(_ nombre: String, _ apellido: String, _ dni: String) -> Alumno {
    return Alumno(nombre: nombre, apellido: apellido, dni: dni)
}
agregarAlumno("Kenyi", "Rodriguez", "98765432")



//RECOMENDADO
func agregarAlumno(nombre: String, apellido: String, dni: String) -> Alumno {
    return Alumno(nombre: nombre, apellido: apellido, dni: dni)
}
agregarAlumno(nombre: "Kenyi", apellido: "Rodriguez", dni: "87654321")


//Recomendada
func agregarAlumnoConNombre(_ nombre: String, conApellido apellido: String, conDni dni: String) -> Alumno {
    return Alumno(nombre: nombre, apellido: apellido, dni: dni)
}
agregarAlumnoConNombre("Kenyi", conApellido: "Rodriguez", conDni: "87654321")


func sumarNumero(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

sumarNumero(n1: 12, n2: 1)


let promedioFinal = 11.5

if promedioFinal < 12.5 {
    print("JALADO")
}else{
    print("APROBO!")
}

promedioFinal < 12.5 ? print("JALADO") : print("APROBO!")

let edadAlumno = 19
let esMayorDeEdad = edadAlumno >= 18
print(esMayorDeEdad)
let mensaje = edadAlumno >= 18 ? "Mayor de edad" : "Menor de edad"
print(mensaje)



