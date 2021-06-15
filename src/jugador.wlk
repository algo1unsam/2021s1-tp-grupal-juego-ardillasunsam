import wollok.game.*
import entes.*
import fisicas.*
import direcciones.*
import niveles.*

class Jugador inherits EnteBot {
		
	override method prioridadColisiones() = 40
	
	override method image() {
		if (self.estaVivo()) {
			return(self.grafico()+"_"+self.direccion()+".png")
		} else {
			return ("sangre.png")
		}
	}

	override method bajarVida() {
		if (self.estaVivo()) {self.vidas(self.vidas()-1)}

		if (self.estaVivo()) {
			self.position(game.at(0,1))
		
		} else {
			perdiste.iniciar()
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
		self.agregarItemAlInventario(objeto)
	}
	
}

