class Actividad {
	
	method idiomas()
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method cantidadDeDias()
	method esRecomendadaPara(socio)
	
}

class Viaje inherits Actividad {
	
	const idiomas
	
	override method idiomas() { return idiomas }
	method esInteresante() { return idiomas.size() > 1 }
	override method esRecomendadaPara(socio) { return self.esInteresante() and socio.leAtrae(self) and not socio.yaRealizo(self) }
	
}

class ViajeDePlaya inherits Viaje {
	
	const largoDePlaya
	
	override method implicaEsfuerzo() { return largoDePlaya > 1200 }
	override method sirveParaBroncearse() { return true }
	override method cantidadDeDias() { return largoDePlaya / 500 }
	
}

class ExcursionACiudad inherits Viaje {
	
	const cantidadDeAtracciones
	
	override method implicaEsfuerzo() { return cantidadDeAtracciones.between(5, 8)}
	override method sirveParaBroncearse() { return false }
	override method cantidadDeDias() { return cantidadDeAtracciones / 2 }
	override method esInteresante() { return super() or cantidadDeAtracciones == 5 }
	
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	
	override method sirveParaBroncearse() { return true }
	override method cantidadDeDias() { return super() + 1 }
	
}

class SalidaDeTrekking inherits Viaje {
	
	const kilometrosARecorrer
	const diasDeSolPorAnio
	
	override method implicaEsfuerzo() { return kilometrosARecorrer > 80 }
	override method sirveParaBroncearse() { return diasDeSolPorAnio > 200 or diasDeSolPorAnio.between(100, 200) and kilometrosARecorrer > 120 }
	override method cantidadDeDias() { return kilometrosARecorrer / 50 }
	override method esInteresante() { return super() and diasDeSolPorAnio > 140 }
	
}

class ClaseDeGimnasia inherits Actividad {
	
	override method idiomas() { return ["Español"] }
	override method implicaEsfuerzo() { return true }
	override method sirveParaBroncearse() { return false }
	override method cantidadDeDias() { return 1 }
	override method esRecomendadaPara(socio) { return socio.edad().between(20, 30) }
	
}


class TallerLiterario inherits Actividad {
	
	const libros
	
	override method idiomas() { return libros.map({ libro => libro.idioma() }).asSet() }
	method hayUnLibroExtenso() { return libros.any({ libro => libro.esExtenso() }) }
	method sonDelMismoAutor() { return libros.map({ libro => libro.nombreDelAutor() }).asSet().size() == 1 and libros.size() > 1 }
	override method implicaEsfuerzo() { return self.hayUnLibroExtenso() or self.sonDelMismoAutor() }
	override method sirveParaBroncearse() { return false }
	override method cantidadDeDias() { return libros.size() + 1 }
	override method esRecomendadaPara(socio) { return socio.hablaMasDeUnIdioma() }
	
}

class Libro {
	
	const idioma
	const cantidadDePaginas
	const nombreDelAutor
	
	method idioma() { return idioma }
	method cantidadDePaginas() { return cantidadDePaginas }
	method nombreDelAutor() { return nombreDelAutor }
	method esExtenso() { return cantidadDePaginas > 500 }
	
}