import seresHablantes.*

class Territorio {
	const seres = #{}
	var cantidadDeLembas = 10
	var cantidadDeTabaco = 10
	
	method quitarLambas(cant){
		cantidadDeLembas = 0.max(cantidadDeLembas - cant)
	}
	
	method quitarTabaco(cant){
		cantidadDeTabaco = 0.max(cantidadDeTabaco - cant)
	}
	
	method cantidadDeLembas() = cantidadDeLembas
	
	method cantidadDeTabaco() = cantidadDeTabaco
	
	method agregarSer(unSer){
		seres.add(unSer)
	}
	
	method quitarSer(unSer){
		seres.remove(unSer)
	}
	
	method consumirRecursos(){
		seres.forEach({s => s.tomarRecursos(self)})
	}
	
	method seresConHabilidadMayorA(cantidad) = seres.filter({s => s.habilidad() > cantidad})
	method estaEnPaz() = seres.all({s => s.estaConformeEnTerritorio(self)})
	
	method somnolencia(){
		seres.forEach({s => s.sufrirSuenioProfundo()})
	}
	
	method seresConhabilidadEntre(primero,segundo) = seres.filter({s => s.habilidad().between(primero,segundo)})
	method capitan() = self.seresConhabilidadEntre(1000,3000).max({s => s.habilidad()})
	
	method seresTorpes()= seres.filter({s => s.habilidad() < 1000})
	
	method seresInmortales() = seres.filter({s => s.esInmortal()})
	method MaximoHabilidadDeSeresInmortales(){
		return self.seresInmortales().max({s => s.habilidad()}).habilidad()
	}
	
	method cantidadDeSeres() = seres.size()
	method promedioDeHabilidad() = (seres.sum({s => s.habilidad()}) / self.cantidadDeSeres()).truncate(0)
	
	method esTerritorioSabio() = seres.all({s => s.habilidad() > 300})
	
	method huboUnTorneo(){
		seres.forEach({s => s.adquirirExperiencia()})
	}
	
	method huboEpifania(){
		self.seresTorpes().forEach({s => s.adquirirExperiencia()})
	}
	
	method hayAlgunSerMortal() = seres.any({s => not s.esInmortal()})
}
