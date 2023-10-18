import pacientes.*

class Magneto{
	var property color= "blanco"
	var imantacion= 800

	method puedeUsar(unPaciente) = true
	method usar(unPaciente){
		unPaciente.disminuirDolor(unPaciente.dolor()*0.1)
		imantacion = 0.max(imantacion--)
	}
		
	method necesitaMantenimiento()= imantacion <100
	method hacerMantenimiento(){
		if(self.necesitaMantenimiento())
			imantacion +=500
		else
			self.error("No necesita mantenimiento")
	}
}

class Bicicleta{
	var property color= "blanco"
	var tornillos= 0
	var aceite=0
	
	method puedeUsar(unPaciente) = unPaciente.edad()>8
	method usar(unPaciente){
		tornillos++
		if(unPaciente.dolor()>30 && unPaciente.edad().between(30,50)) aceite++
		unPaciente.disminuirDolor(4)
		unPaciente.fortaleza(unPaciente.fortaleza()+3)	
	}
	
	method necesitaMantenimiento()= tornillos>=10 or aceite>= 5
	method hacerMantenimiento(){
		tornillos= 0
	    aceite=0
	}
}

class Minitramp{
	var property color= "blanco"
	method puedeUsar(unPaciente) = unPaciente.dolor()<20
	
	method usar(unPaciente){
		unPaciente.fortaleza(unPaciente.fortaleza()+(unPaciente.edad()*0.1))	
	}
	
	method necesitaMantenimiento(){}
	method hacerMantenimiento(){}
}
