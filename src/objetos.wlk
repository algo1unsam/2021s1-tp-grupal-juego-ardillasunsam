import wollok.game.*
import jugador.*
import mecanicas.*
import niveles.*
import direcciones.*

class Ente {
	var property muerto = false
	var property position
	var property direccion = derecha
	var property grafico

	method image() = grafico
}

class EnteBot inherits Ente {
	var property tiempo = 500
	var property puntoActual = 0
	var property puntos = []
	
	override method image() = (self.grafico() + "_" + self.direccion() + ".png")

	method agregarPunto(coordenadaX, coordenadaY) {
		puntos.add([coordenadaX, coordenadaY])
	}
	
	method iniciarMovimiento() {
		game.onTick(self.tiempo(), "MOVIMIENTO", { self.movimiento() })
	}
	
	method puntoX(numeroDepPunto) {
		return puntos.get(numeroDepPunto).first()
	}
	
	method puntoY(numeroDepPunto) {
		return puntos.get(numeroDepPunto).last()
	}
	
	method movimiento() {
		if (self.position().x() < self.puntoX(puntoActual)) {
			derecha.girar(self)
		} else if (self.position().x() > self.puntoX(puntoActual)) {
			izquierda.girar(self)
		} else {
			if (self.position().y() > self.puntoY(puntoActual)) {
				abajo.girar(self)
			} else if (self.position().y() < self.puntoY(puntoActual)) {
				arriba.girar(self)
			} else {
				if ((puntoActual+1) == puntos.size()) {
					puntoActual = 0
				} else {
					puntoActual += 1
				}
			}
		}
		
		if (not self.colisionoConJugador(nivel1.jugadores())) {
			self.direccion().mover(1, self)
		}
	}
	
	method colisionoConJugador(jugadores) {
		return jugadores.all({ unJugador => position == unJugador.position() })
	}
}

class EnteMalvado inherits EnteBot {

	method teEncontro(alguien) {
		if (alguien.vidas() > 0) {
			alguien.bajarVida()
			alguien.gritar()
			alguien.position(game.origin())
		} else {
			alguien.muerto(true)
			game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
			game.schedule(3500, { game.stop()})
		}
	}

}

class Camioneta inherits EnteBot {

	method teEncontro(alguien) {
		if (alguien.herramientas().size() == 4){
		game.say(self, "GANASTE")
		game.schedule(1000, { game.stop()})}
	// nivel2.iniciar() estamos viendo como 
	}

}

class Bloque inherits Ente {
	method teEncontro(alguien) {
		alguien.direccion().direccionOpuesta().girar(alguien)
		alguien.direccion().mover(1, alguien)
	}
}

class Herramienta inherits Ente{
	method teEncontro(alguien){
		alguien.agarrar(self)
		game.removeVisual(self)
	}
}


