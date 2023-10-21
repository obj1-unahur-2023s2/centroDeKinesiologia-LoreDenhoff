import pacientes.*
import aparatos.*

object centro{
	const aparatos=[]
	const pacientes=[]
	
	method agregarUnAparato(unAparato){aparatos.add(unAparato)}
	method agregarAparatos (listAparatos){ aparatos.addAll([listAparatos])}
	method agregarUnPaciente(unPaciente){aparatos.add(unPaciente)}
	method agregarPacientes (listPacientes){ aparatos.addAll([listPacientes])}
	method colorAparatos()= aparatos.map({a => a.color()}).asSet()
	method menoresDeOcho()= pacientes.filter({p =>p.edad()<8})
	method cantHacenRutina()= pacientes.count({p => !p.puedeHacerRutina()})
	method optimasCondiciones()= aparatos.all({a => !a.necesitaMantenimiento()})
	method estComplicado()= (aparatos.count({a => a.necesitaMantenimiento()})) >= (aparatos.size()/2)
	method mantenimientoGral()= aparatos.filter({a => a.necesitaMantenimiento()})
	method visitaTecnico(){self.mantenimientoGral().forEach({a => a.hacerMantenimiento()})
		
	}
}