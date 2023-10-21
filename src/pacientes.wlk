import aparatos.*

class Paciente{
	var property edad=0
	var property fortaleza=0
	var property dolor=0
	const rutina=[] 
	
	method agregarARutina(unAparato) {rutina.add(unAparato)} 
	method puedeUsar(unAparato) = unAparato.puedeUsar(self)
	method usarAparato(unAparato){unAparato.usar()}
	method puedeHacerRutina()= rutina.all({a => a.puedeUsar(self)})
	method hacerRutina() {rutina.forEach({a => a.usar(self)})}
	method disminuirDolor(unValor){
		dolor =0.max(dolor-unValor)
	}
}

class Resistente inherits Paciente{
	override method hacerRutina() {
		super()
		fortaleza += rutina.size()
	}
}

class Caprichoso inherits Paciente{
	override method puedeHacerRutina()= super() && rutina.any({a => a.color().equals("rojo")})
		override method hacerRutina() {
		super()
		super()
		}
}

class RapidaRecuperacion inherits Paciente{
		
		override method hacerRutina() {
		super()
		self.disminuirDolor(elDolor.gradoDolor())
	}
}

object elDolor{
	const property gradoDolor=3
}