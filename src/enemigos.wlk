import wollok.game.*
import personaje.*
import movimiento.*

class Enemigo {

	var property position
	var property girar = 0
	var property grafico

	method image() = grafico

	// method position() = game.center()
	method teEncontro(alguien) {
		alguien.image('sangre.png')
		alguien.muerto(1)
		game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
			// self.detenerGravedad(config)
		game.schedule(3500, { game.stop()})
	}

	/* 
	 * method detenerGravedad(configure) {
	 * 	configure.DetenerEventosTiempo("GRAVEDAD")
	 * }
	 */
	// REVISAR PORQUE NO GENERA EFECTO
	method movimiento() {
		if (not self.colisionoConPersonaje()) {
			if (girar == 0) {
				self.derecha()
				if (position.x() == 10) {
					girar = 1
				}
			}
			if (girar == 1) {
				self.izquierda()
				if (position.x() == 0) {
					girar = 0
				}
			}
		}
	}

	method derecha() {
		position = position.right(1)
	}

	method izquierda() {
		position = position.left(1)
	}

	method eventoMovimiento() {
		game.onTick(300, "MOVIMIENTO", { self.movimiento()}) // habria que revisar este metodo 
	}

	method colisionoConPersonaje() {
		return position == personaje.position()
	}

}

class Trampa {

	var property position
	var property grafico

	method image() = grafico

	method teEncontro(alguien) {
		alguien.image('sangre.png')
		game.say(self, "¡¡GAME OVER!!")
			// self.detenerGravedad(config)
		game.schedule(3500, { game.stop()})
	}

}

