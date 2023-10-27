class Elfo{
	var cancionesQueSabe = 20
	
	method cancionesQueSabe() = cancionesQueSabe
	
	method esInmortal() = true 
	method habilidad() = if(cancionesQueSabe <= 60){180}else{cancionesQueSabe * 3}
	method adquirirExperiencia(){
		cancionesQueSabe = cancionesQueSabe *2
	}
	
	method sufrirSuenioProfundo(){
		cancionesQueSabe = 0.max(cancionesQueSabe - 10)
	}
	
	method estaConformeEnTerritorio(territorio) = territorio.cantidadDeLembas() >= 8

	method tomarRecursos(territorio){
		if(not territorio.cantidadDeLembas() >= 3){
			self.error("No puede retirar recursos")
		}
		territorio.quitarLambas(3)
		cancionesQueSabe += 15
	}
}

class ElfoSilvano inherits Elfo{
	
	override method habilidad() = super() + 400
}

class Hobbit{
	var cantidadDeAmigos = 40
	var cantidadDeHistorias = 6
	
	method cantidadDeAmigos() = cantidadDeAmigos
	
	method esInmortal() = cantidadDeAmigos >= 20
	method habilidad() = if(cantidadDeAmigos < 60){cantidadDeHistorias * 100}else{cantidadDeHistorias * 50}
	method adquirirExperiencia(){
		cantidadDeAmigos += 8
	}
	method organizarFiesta(){
		cantidadDeAmigos += 5
		cantidadDeHistorias += 5
	}
	
	method sufrirSuenioProfundo(){
		cantidadDeAmigos = 0.max(cantidadDeAmigos - 3)
	}
	
	method estaConformeEnTerritorio(territorio) = territorio.seresConHabilidadMayorA(self.habilidad()).size() >= 2

	method tomarRecursos(territorio){
		if(not territorio.cantidadDeTabaco() >= 4){
			self.error("No puede retirar recursos")
		}
		territorio.quitarTabaco(4)
		cantidadDeAmigos += 7
		cantidadDeHistorias += 7
	}
}

class Enano{
	var cantDeIra = 200
	
	method cantDeIra() = cantDeIra
	
	method esInmortal() = false
	method habilidad()= cantDeIra * 2
	method adquirirExperiencia(){
		cantDeIra += 300
	}
	
	method sufrirSuenioProfundo(){
		cantDeIra = 0.max(cantDeIra - 50)
	}
	
	method estaConformeEnTerritorio(territorio) = not territorio.seresTorpes().isEmpty()

	method tomarRecursos(territorio){}
	
	method equilibrarse(){
		if (self.habilidad() <= 700){
			self.adquirirExperiencia()
		}else{
			self.sufrirSuenioProfundo()
		}
	}
}

class EnanoHerrero inherits Enano{
	var cantidadDeEspadasFabricadas = 3
	
	override method habilidad() = cantidadDeEspadasFabricadas * 100
	override method adquirirExperiencia(){
		super()
		cantidadDeEspadasFabricadas += 1
	}
}

class EnanoFurioso inherits Enano{
	var property topeDeHabilidad = 2000
	
	override method habilidad() = if(super() <= topeDeHabilidad){super()}else{topeDeHabilidad}
}

class EnanoMinero inherits Enano{
	const escondites = #{}
	
	override method adquirirExperiencia(){
		super()
		escondites.add(new Escondite())
	}
	
	override method sufrirSuenioProfundo(){
		super()
		if(escondites.size() >= 2){
			escondites.forEach({e => e.agregarCantados(1)})
		}
	}
	
	method cantidadValotTotal() = escondites.sum({e => e.valor()})
	
	override method cantDeIra() = cantDeIra + self.cantidadValotTotal()
	
}

class Escondite{
	var cantDeCantados = 5
	var cantidadDeOro = 3
	
	method valor() = (cantDeCantados * cantidadDeOro) + 20
	
	method cantDeCantados() = cantDeCantados
	method agregarCantados(cant){
		cantDeCantados += cant
	}
	method quitarCantados(cant){
		cantDeCantados = 0.max(cantDeCantados - cant)
	}
	
	method cantidadDeOro() = cantidadDeOro
	method agregarOro(cant){
		cantidadDeOro += cant
	}
	method quitarOro(cant){
		cantidadDeOro = 0.max(cantidadDeOro - cant)
	}
}