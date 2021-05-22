import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*

object teclado {

	method asignarFlechasPara(jugadorN) {
		keyboard.left().onPressDo({ izquierda.girar(jugadorN)
			izquierda.mover(jugadorN)
		})
		keyboard.right().onPressDo({ derecha.girar(jugadorN)
			derecha.mover(jugadorN)
		})
		keyboard.up().onPressDo({ arriba.girar(jugadorN)
			arriba.mover(jugadorN)
		})
		keyboard.down().onPressDo({ abajo.girar(jugadorN)
			abajo.mover(jugadorN)
		})
	}

	method asignarWASDPara(jugadorN) {
		keyboard.a().onPressDo({ izquierda.girar(jugadorN)
			izquierda.mover(jugadorN)
		})
		keyboard.d().onPressDo({ derecha.girar(jugadorN)
			derecha.mover(jugadorN)
		})
		keyboard.w().onPressDo({ arriba.girar(jugadorN)
			arriba.mover(jugadorN)
		})
		keyboard.s().onPressDo({ abajo.girar(jugadorN)
			abajo.mover(jugadorN)
		})
	}

	method hablar(ente) {
		keyboard.x().onPressDo({ ente.mensajeRandom()})
	}

	method presionarEnter(presentacion) {
		keyboard.enter().onPressDo({ presentacion.continuar()})
	}
	
}

object fisicas {
	method colisiones(jugadores) {
		jugadores.forEach({ unJugador => game.onCollideDo(unJugador, { algo => algo.teEncontro(unJugador)})})
	}
}

