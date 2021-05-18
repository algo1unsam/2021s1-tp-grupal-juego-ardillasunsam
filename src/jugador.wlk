import wollok.game.*
import objetos.*
import mecanicas.*

class Jugador inherits Objeto {
	
	var property vidas = 3
	
	override method image() {
		if (not muerto) {
			return (self.grafico() + "_" + self.direccion() + ".png")
		} else {
			return ("sangre.png")
		}
	}
	
	method bajarVida(){
		vidas -=1
	}
	
	method gritar(){
		if (vidas == 2) {		
		game.say(self, "ME QUEDAN 2 VIDAS")		
		}
		if (vidas == 1) {		
		game.say(self, "ME QUEDAN 1 VIDA. CUIDADOOO")		
		}
	}
}

