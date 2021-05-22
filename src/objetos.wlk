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

	var property puntoActual = 0
	var property puntos = []

	override method image() = (self.grafico() + "_" + self.direccion() + ".png")

	method agregarPunto(coordenadaX, coordenadaY) {
		puntos.add([ coordenadaX, coordenadaY ])
	}

	method iniciarMovimiento(tipoDeMovimiento,tiempo) {
		puntos.add([self.position().x(),self.position().y()])
		game.onTick(tiempo, self.toString(), {self.movimiento(tipoDeMovimiento)})
		
	}

	method puntoX(numeroDePunto) {
		return puntos.get(numeroDePunto).first()
	}

	method puntoY(numeroDePunto) {
		return puntos.get(numeroDePunto).last()
	}

	method movimiento(tipoDeMovimiento) {
		if (not self.girarEnEjeX()) {
			if (not self.girarEnEjeY()) {
				self.puntoAlcanzado(tipoDeMovimiento)
			}
		}
		if (not self.colisionoConJugador(nivel1.jugadores())) {
			self.direccion().mover(self)
		}
	}
	
	method girarEnEjeX() {
		if (self.position().x() < self.puntoX(puntoActual)) {
			derecha.girar(self)
			return true
		} else if (self.position().x() > self.puntoX(puntoActual)) {
			izquierda.girar(self)
			return true
		} else {
			return false
		}
	}
	
	method girarEnEjeY() {
		if (self.position().y() > self.puntoY(puntoActual)) {
			abajo.girar(self)
			return true
		} else if (self.position().y() < self.puntoY(puntoActual)) {
			arriba.girar(self)
			return true
		} else {
			return false
		}
	}

	method puntoAlcanzado(tipoDeMovimiento) {
		if ((puntoActual + 1) == puntos.size()) {
			if (tipoDeMovimiento == "ciclico") {
				puntoActual = 0
			} else {
				game.removeTickEvent(self.toString())
			}
		} else {
			puntoActual += 1
		}
	}

	method colisionoConJugador(jugadores) {
		return jugadores.all({ unJugador => position == unJugador.position() })
	}

}

class EnteMalvado inherits EnteBot {
	method teEncontro(alguien) {
		alguien.bajarVida()
		if (alguien.vidas() > 0) {
			alguien.gritar()
			alguien.position(game.origin())
		} else {
			alguien.muerto(true)
			game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
			game.schedule(3500, {game.stop()})
		}
	}
}

class Bloque inherits Ente {
	method teEncontro(alguien) {
		alguien.direccion().direccionOpuesta().mover(alguien)
	}
}

class Camioneta inherits Bloque {
   override  method teEncontro(alguien) {
		if (alguien.herramientas().size() == 4) {
			game.say(self, "GANASTE")
			game.schedule(1000, { game.stop()})
		} else {
			super(alguien)
		}
	}
}

class Herramienta inherits Ente {
	method teEncontro(alguien) {
		alguien.agarrar(self)
		game.removeVisual(self)
	}
}

//object fotograma inherits Ente{
	
	//method iniciarAnimacion(imagen){
	//game.onTick(tiempo, self.toString(), { self.movimiento(banderaMovimiento)})
	//}
	
			
//}

class BarraVida inherits Ente {
	var property jugador
	
	override method image() = (self.grafico() + jugador.vidas().toString() + ".png")
	
	method teEncontro(alguien){
		
	}
}