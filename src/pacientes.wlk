import aparatos.*

class Paciente{
	const property edad
	var property fortaleza
	var property dolor
	const rutina=[]
	
	method puedeUsar(unAparato)= unAparato.puedeSerUsado(self)
	
	method usarAparato(unAparato){
		if(!self.puedeUsar(unAparato)){
			self.error("El paciente no puede usar el aparato")
		}
		fortaleza += unAparato.sumaFortaleza(self)
		dolor = 0.max(dolor-unAparato.restaDolor(self))
	}
	
	method cargarRutina(lista){rutina.addAll(lista)}
	
	method puedeHacerRutina()= rutina.all({a => a.puedeSerUsado(self)})
	
	method hacerRutina(){
		if(!self.puedeHacerRutina())
			self.error("No puede usar todos los aparatos")
		else
			rutina.forEach({a => self.usarAparato(a)})
	}
}

class Resistente inherits Paciente{
	override method hacerRutina(){
		super()
		fortaleza += rutina.size()
	}
}

class Caprichoso inherits Paciente{
	method aparatoRojo()= rutina.any({a => a.color().equals("rojo")})
	override method puedeHacerRutina() = super() && self.aparatoRojo()
	
	override method hacerRutina(){super() super()}
}

class RapidaRec inherits Paciente{
		override method hacerRutina(){
		super()
		dolor -= 0.max (valor.recuperacion())
	}
}

object valor{
	var property recuperacion=3
}

