import pacientes.*

class Aparato{
	var property color= "blanco"
	
	method puedeUsar(unPaciente)
	method usar(unPaciente)
	method necesitaMantenimiento()
	method hacerMantenimiento()
}

class Magneto inherits Aparato{
	var imantacion= 800

	override method puedeUsar(unPaciente) = true
	override method usar(unPaciente){
		unPaciente.disminuirDolor(unPaciente.dolor()*0.1)
		imantacion = 0.max(imantacion--)
	}
		
	override method necesitaMantenimiento()= imantacion <100
	override method hacerMantenimiento(){
		if(self.necesitaMantenimiento())
			imantacion +=500
		else
			self.error("No necesita mantenimiento")
	}
}

class Bicicleta inherits Aparato{
	var tornillos= 0
	var aceite=0
	
	override method puedeUsar(unPaciente) = unPaciente.edad()>8
	override method usar(unPaciente){
		if(unPaciente.dolor()>30) tornillos ++
		if( unPaciente.edad().between(30,50)) aceite++
		unPaciente.disminuirDolor(4)
		unPaciente.fortaleza(unPaciente.fortaleza()+3)	
	}
	
	override method necesitaMantenimiento()= tornillos>=10 or aceite>= 5
	override method hacerMantenimiento(){
		tornillos= 0
	    aceite=0
	}
}

class Minitramp inherits Aparato{
	override method puedeUsar(unPaciente) = unPaciente.dolor()<20
	
	override method usar(unPaciente){
		unPaciente.fortaleza(unPaciente.fortaleza()+(unPaciente.edad()*0.1))	
	}
	override method necesitaMantenimiento(){}
	override method hacerMantenimiento(){}
}
