import idiomas.*
import actividades.*

class Socio {
	var actividadesRealizadas = [] //clases de gimnasia o viajes
	var property maximoDeActividades = 0
	var property edad
	var idiomasQueHabla = []
	var property tipoDeSocio
	
	method leAtraeLaActividad(actividad) = tipoDeSocio.condicion(actividad, self)
	
	method hicisteLaActividad(actividad) = actividadesRealizadas.contains(actividad)
	
	method agregarIdioma(idioma) = idiomasQueHabla.add(idioma)
	
	method hablaElIdioma(idioma) = idiomasQueHabla.contains(idioma)
	
	method realizarUnaActividad(actividad) {
		if ( actividadesRealizadas.size() < maximoDeActividades ) actividadesRealizadas.add(actividad)
		else throw new Exception ("No se puede agregar "+actividad+" porque ya se alcanzó el maximo")
	}
	
	method adoraElSol() = actividadesRealizadas.all { actividad => actividad.sirveParaBroncearse() }
	
	method actividadesEsforzadas() = actividadesRealizadas.filter { actividad => actividad.implicaEsfuerzo() }
}

object tranquilo {
	method condicion(actividad, socio) = actividad.cantidadDeDias() > 4
}

object coherente {
	method condicion(actividad, socio) = socio.adoraElSol() and actividad.sirveParaBroncearse() or actividad.implicaEsfuerzo()
}

object relajado {
	method condicion(actividad, socio) = actividad.idiomas().any{ idioma => socio.hablaElIdioma(idioma)}
}
