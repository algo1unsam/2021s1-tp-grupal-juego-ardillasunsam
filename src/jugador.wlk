import wollok.game.*
import entes.*
import fisicas.*
import direcciones.*

class Jugador inherits Ente {

	var property herramientas = []
	
	override method prioridadColisiones() = 40
	
	override method image() {
		if (self.estaVivo()) {
			return(self.grafico()+"_"+self.direccion()+".png")
		} else {
			return ("sangre.png")
		}
	}

	override method bajarVida() {
		// Este IF aunque tenga la misma condicion,
		// debe permanecer separado del siguiente IF,
		// ya que evalua si aun sigue vivo luego de
		// cumplirse este IF.
		if (self.estaVivo()) {self.vidas(self.vidas()-1)}

		if (self.estaVivo()) {
			self.position(game.origin())
			self.gritar()
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

	override method colisionar(objeto) {
		herramientas.add(objeto)
		game.removeVisual(objeto)
	}
	
}

