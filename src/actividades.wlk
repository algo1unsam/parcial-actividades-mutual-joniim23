import idiomas.*
import socios.*

class Actividad {
	var property idiomas = []
	
	method agregarIdioma(idioma) = idiomas.add(idioma)
	
	method seRecomiendaASocio(socio)
	
	method cantidadDeDias() 
	
	method implicaEsfuerzo()
	
	method sirveParaBroncearse()
	
}

class Gimnasio inherits Actividad {
	override method idiomas() = [espaniol]
	
	override method seRecomiendaASocio(socio) = 20 < socio.edad() and socio.edad() < 30 
	
	override method cantidadDeDias() = 1
	
	override method implicaEsfuerzo() = true
	
	override method sirveParaBroncearse() = false
}

class Viaje inherits Actividad { 
	override method seRecomiendaASocio(socio) = self.esInteresante() and socio.leAtraeLaActividad(self) and socio.hicisteLaActividad(self)

	method esInteresante() = idiomas.size() > 1
}

class ViajeALaPlaya inherits Viaje {
	var property largo = 0
	
	override method cantidadDeDias() = largo / 500
	
	override method implicaEsfuerzo() = largo > 1200
	
	override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje {
	var property cantidadDeAtracciones
	
	override method cantidadDeDias() = cantidadDeAtracciones / 2
	
	override method implicaEsfuerzo() = cantidadDeAtracciones >= 5
	
	override method sirveParaBroncearse() = false
	
	override method esInteresante() = super() or cantidadDeAtracciones == 5 
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	override method cantidadDeDias() = super() + 1
	
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje {
	var property senderos
	var property diasDeSol
	
	override method cantidadDeDias() = senderos / 50
	
	override method implicaEsfuerzo() = senderos > 80
	
	override method sirveParaBroncearse() = diasDeSol > 200 or (diasDeSol > 100 and senderos > 120)
	
	override method esInteresante() = super() and diasDeSol > 140
}

class TallerLiterario inherits Actividad {
	var libros = []
	
	override method idiomas() = libros.map { libro => libro.idioma() }
	
	override method cantidadDeDias() = libros.size() + 1
	
	override method implicaEsfuerzo() = self.paginasMayoresA500() or self.hayAlgunLibro() and self.mismoAutorEnTodosLosLibros()
	method paginasMayoresA500() = libros.any{libro => libro.cantidadDePaginas() > 500}
	method hayAlgunLibro() = libros.size() > 1
	method mismoAutorEnTodosLosLibros() = libros.all {libro => libro.autor() == libros.first()}
	
	override method seRecomiendaASocio(socio) = socio.idiomasQueHabla() > 1 
}

class Libro {
	const property idioma 
	const property cantidadDePaginas
	const property autor
}