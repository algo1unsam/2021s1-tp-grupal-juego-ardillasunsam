import wollok.game.*
import objetos.*
import mecanicas.*
import direcciones.*

class Jugador inherits Ente {
	var property herramientas = []
	
	override method image() {
		if (self.estaVivo()) {
			return(self.grafico()+"_"+self.direccion()+".png")
		} else {
			return ("sangre.png")
		}
	}

	override method bajarVida() {
		vidas -= 1
		self.gritar()
		self.position(game.origin())
	}

	method gritar() {
		if (vidas == 2) {
			game.say(self, "ME QUEDAN 2 VIDAS")
		}
		if (vidas == 1) {
			game.say(self, "ME QUEDAN 1 VIDA. CUIDADOOO")
		}
	}

	method mensajeRandom() {
		const random = new Range(start = 1, end = 3).anyOne()
		if (random == 1) {
			game.say(self, "MALDITOS DEMONIOS")
		}
		if (random == 2) {
			game.say(self, "ME PARECE QUE TENGO HAMBRE")
		}
		if (random == 3) {
			game.say(self, "ESTOY MUY ASUSTADO")
		}
	}

	method agarrar(algo) {
		herramientas.add(algo)
	}

}

