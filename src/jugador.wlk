import wollok.game.*
import objetos.*
import fisicas.*
import direcciones.*

class Jugador inherits Ente {

	var property herramientas = []
	
	override method prioridadColiciones() = 1
	
	override method image() {
		if (self.estaVivo()) {
			return(self.grafico()+"_"+self.direccion()+".png")
		} else {
			return ("sangre.png")
		}
	}

	override method bajarVida() {
		self.vidas(self.vidas()-1)
		self.gritar()
		if (self.estaVivo()) {
			self.position(game.origin())
		} else {
			game.schedule(3500, {game.stop()})
		}
	}

	method gritar() {
		if (self.vidas() == 2) {
			game.say(self, "ME QUEDAN 2 VIDAS")
		}
		if (self.vidas() == 1) {
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

	override method teEncontro(objeto) {
		herramientas.add(objeto)
	}
	
}

