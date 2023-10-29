class Ave {
	method fuerza()
	method recibirDisgusto()
	method esDebil() = self.fuerza() < 1000
	method relax()
	method estaConformeCon(isla)
	method alimentarse(isla)
}

class Aguilucho inherits Ave {
	var velocidad = 20
	method velocidad()=velocidad
	override method fuerza()=if(velocidad <= 60) {180}else{velocidad * 3}
	
	override method recibirDisgusto() {
		velocidad *=2
	}
	
	override method relax() {
		velocidad =  150.min(velocidad + 10)
	}
	
	override method estaConformeCon(isla) {
		return isla.alpiste() >= 8 
	}
	
	override method alimentarse(isla) {
		isla.alpiste(3)
		velocidad  += 15
	}
}

class Albatro inherits Ave {
	var peso = 4000
	var masaMuscular = 600
	
	method peso() = peso
	override method fuerza() = if(peso < 6000 ) {masaMuscular}else {masaMuscular * 0.5}
	override method recibirDisgusto() {
		peso += 800
	}
	method irAlGimnasio(){
		masaMuscular += 500
		peso += 500
	}
	override method relax() {
		peso = 0.max(peso - 300)
	}
	override method estaConformeCon(isla) {
		return isla.avesConMasFuerza(self.fuerza()) >=2 
	}	
	override method alimentarse(isla) {
		isla.maiz(4)
		peso += 700
		masaMuscular += 700
	}
}

class Paloma inherits Ave {
	var ira = 200
	method ira()=ira
	override method fuerza() = ira * 2
	override method recibirDisgusto() {
		ira += 300
	}
	override method relax() {}
	override method estaConformeCon(isla) {
		return isla.aves().any { ave => ave.esDebil() and ave != self}
	}	
	override method alimentarse(isla) {}
	
	method equilibrarse() {
		if (self.fuerza() <= 700) {
			self.recibirDisgusto()
		} else {
			self.relax()
		}
	}
}

class AguiluchoColorado inherits Aguilucho {
	override method fuerza() = super() + 400 
}

class PalomaTorcaza inherits Paloma {
	var huevos = 3
	override method fuerza() = super() + huevos * 100
	override method recibirDisgusto() {
		super()
		huevos += 1
	}
	override method relax() {
		ira = 0.max( ira - 25.randomUpTo(50).truncate(0))
	}	
}

class PalomaMontera inherits Paloma {
	const tope = topeFuerza
	override method fuerza() = tope.topeValor().min(super())  
}

object topeFuerza {
	var property topeValor = 2000
}

class PalomaManchada inherits Paloma {
	var property nidos = []
	override method recibirDisgusto() {
		super()
		nidos.add(new Nido())
	}
	override method relax() {
		super()
		if (nidos.size() > 2){
			nidos.forEach { n => n.aumentarGrosor(1)}
		}
	}
	
	method potencia() {
		return nidos.sum { n => n.potencia() }
	}
	
	override method ira() {
		return super() + self.potencia() 
	}
}


class Nido {
	var grosor = 5
	const resistencia = 3

	method grosor()= grosor
	method resistencia() = resistencia
	
	method aumentarGrosor(unidades){
		grosor += unidades
	}
	
	method potencia() {
		return (grosor * resistencia) + 20
	}
	
}
