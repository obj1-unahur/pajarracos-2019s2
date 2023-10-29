import aves.*
class Isla {
	const aves = []
	var alpiste = 10
	var maiz =  10
	
	method aves() = aves
	
	method agregarAve(unAve){
		aves.add(unAve)
	}
	
	method quitarAve(unAve) {
		aves.remove(unAve)
	}
	
	method alpiste() = alpiste
	
	method alpiste(unaCantidad) {
		alpiste = 0.max(alpiste - unaCantidad)
	}
	
	method maiz()= maiz
	
	method maiz(unaCantidad) {
		maiz = 0.max(maiz - unaCantidad)
	}
	
	method avesDebiles() {
		return aves.filter { ave => ave.esDebil() }
	}
	method fuerzaTotal() {
		return aves.sum { ave => ave.fuerza() }
	}
	method esRobusta() {
		return aves.all { ave => ave.fuerza() > 300 }
	}
	method terremoto() {
		aves.forEach { ave => ave.recibirDisgusto()}
	}
	method tormenta() {
		self.avesDebiles().forEach {
			ave => ave.recibirDisgusto()
		}
	}
	method candidatasCapitanas(min, max) {
		return aves.filter { ave => ave.fuerza().between(min, max)}
	}
	
	method capitana() {
		const candidatas= self.candidatasCapitanas(1000,3000)
		if (candidatas.isEmpty()) {
			self.error("No hay candidatas para ser capitanas")
		}
		return candidatas.max { ave => ave.fuerza()}	
	}
	
	method avesConMasFuerza(fuerza) {
		return aves.count {ave => ave.fuerza() > fuerza }
	}
	
	method estaEnPaz() {
		return aves.all { ave => ave.estaConformeCon(self)}
	}
}
