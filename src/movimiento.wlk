import wollok.game.*
import enemigos.*
import personaje.*

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ personaje.cambiarGeorge(left)})
		keyboard.right().onPressDo({ personaje.cambiarGeorge(right)})
		keyboard.up().onPressDo({ personaje.cambiarGeorge(up)})
		keyboard.down().onPressDo({ personaje.cambiarGeorge(down)})
	}

	method configurarColisiones() {
		game.onCollideDo(personaje, { algo => algo.teEncontro(personaje)})
	}


	method DetenerEventosTiempo(evento) {
		game.removeTickEvent(evento)
	}

}


