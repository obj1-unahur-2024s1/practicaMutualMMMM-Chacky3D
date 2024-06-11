import actividades.*

class Socio {
	
	const edad
	const idiomas
	const actividadesRealizadas
	const maximoDeActividades
	
	method esAdoradorDelSol() { return actividadesRealizadas.all({ actividad => actividad.sirveParaBroncearse() }) }
	method actividadesEsforzadas() { return actividadesRealizadas.filter({ actividad => actividad.implicaEsfuerzo() }) }
	method alcanzoElLimite() { return actividadesRealizadas.size() == maximoDeActividades }
	method realizar(actividad) { 
		if(self.alcanzoElLimite()){
			self.error("Alcanzó el maximo de actividades a realizar.")
		}
		actividadesRealizadas.add(actividad)
	}
	method leAtrae(actividad)
	method yaRealizo(actividad) { return actividadesRealizadas.contains(actividad) }
	method edad() { return edad }
	method hablaMasDeUnIdioma() { return idiomas.size() > 1 }
	
}

class SocioTranquilo inherits Socio {
	
	override method leAtrae(actividad) { return actividad.cantidadDeDias() >= 4 }
	
}

class SocioCoherente inherits Socio {
	
	override method leAtrae(actividad) { return if(self.esAdoradorDelSol()) actividad.sirveParaBroncearse() else actividad.implicaEsfuerzo() }
	
}

class SocioRelajado inherits Socio {
	
	override method leAtrae(actividad) { return not idiomas.asSet().intersection(actividad.idiomas()).isEmpty() }
	
}