import wollok.game.*

object personaje {

	var property position = game.origin()

	method image() {
		// return "george_frente.png"
		return if (not self.colisionoConEnemigo()) "george_frente.png" else "sangre.png"
	}

	method irA(nuevaPosicion) {
		if (self.DentroDelRangoDeMovilidad(nuevaPosicion) and not self.colisionoConEnemigo()) { // and not self.colisionoConEnemigo()
			position = nuevaPosicion
		}
	}

	method DentroDelRangoDeMovilidad(nuevaPosicion) {
		return nuevaPosicion.x() >= 0 and nuevaPosicion.x() <= 9 and nuevaPosicion.y() >= 0 and nuevaPosicion.y() <= 9
	}

	method colisionoConEnemigo() {
		return position == enemigo.position()
	}

}

object enemigo {

	var property position = game.center()

	method image() = "devil.png"

	// method position() = game.center()
	method teEncontro(alguien) {
		game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
			// self.detenerGravedad(config)
		game.schedule(3500, { game.stop()})
	}

	/* 
	 * method detenerGravedad(configure) {
	 * 	configure.DetenerEventosTiempo("GRAVEDAD")
	 * }
	 */

	//REVISAR PORQUE NO GENERA EFECTO
	method movimiento() {
		if (position.x() <= 9) {
			position = position.right(1)
		}
		if (position.x() >= 0) {
			position = position.left(1)
		}
	}

	method eventoMovimiento() {
		game.onTick(1000, "MOVIMIENTO", { self.movimiento()})//habria que revisar este metodo 
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ personaje.irA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.irA(personaje.position().right(1))})
		keyboard.up().onPressDo({ personaje.irA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.irA(personaje.position().down(1))})
	}

	method configurarColisiones() {
		game.onCollideDo(personaje, { algo => algo.teEncontro(personaje)})
	}

	method configurarGravedad() {
	// game.onTick(0, "GRAVEDAD", { pepita.caerSiEstasVolando()})
	}

	method DetenerEventosTiempo(evento) {
		game.removeTickEvent(evento)
	}

}

object tutorial {

	method iniciar() {
		game.addVisual(personaje)
		game.addVisual(enemigo)
		config.configurarTeclas()
		config.configurarColisiones()
		enemigo.eventoMovimiento()//este esta fallando
	}

}

