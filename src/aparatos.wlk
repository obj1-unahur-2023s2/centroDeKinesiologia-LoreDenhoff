import pacientes.*

class Aparato{
 	var property color ="blanco"
 	method puedeSerUsado(unPaciente)= true
 	method sumaFortaleza(unPaciente)= 0
 	method restaDolor(unPaciente)= 0
 	method efectoDelUso(unPaciente)
	method necesitaMantenimiento() = false
	method recibirMantenimiento() {}
}

class Magneto inherits Aparato{
	var imantacion=800
	
	override method restaDolor(unPaciente)= unPaciente.dolor()*0.1//devuelve valor a restar
	override method efectoDelUso(unPaciente) {imantacion = 0.max(imantacion-1)}
	override method necesitaMantenimiento() = imantacion < 100
	override method recibirMantenimiento() {imantacion = 800.min(imantacion+500)}


}

class Bicicleta inherits Aparato{
	var property cantTornillos = 0
	var property cantAceite = 0

	
	override method puedeSerUsado(unPaciente)= unPaciente.edad() >8
	override method restaDolor(unPaciente)= 4//devuelve valor a restar
	override method sumaFortaleza(unPaciente) = 3//devuelve valor a restar
	override method efectoDelUso(unPaciente) {
		if(unPaciente.dolor()>30) {
			cantTornillos++
		}
		if(unPaciente.edad().between(30,50)) {
			cantAceite++
		}
	}
	override method necesitaMantenimiento() = cantTornillos >= 10 || cantAceite >= 5
	override method recibirMantenimiento() {
		cantTornillos = 0
		cantAceite = 0
	}
}

class Minitramp inherits Aparato{
	
	override method puedeSerUsado(unPaciente)= unPaciente.dolor()<20
	override method sumaFortaleza(unPaciente) = unPaciente.edad()*0.1
	override method efectoDelUso(unPaciente) {}
}