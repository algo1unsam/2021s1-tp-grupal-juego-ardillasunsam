import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*
import niveles.*

object teclado {

	method asignarFlechasPara(jugadorN) {//<------------jugador 1
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

	method asignarWASDPara(jugadorN) {//<-------multi jugador
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

	method asignarMovPlayer1Nivel2(jugadorN) {
		keyboard.left().onPressDo({ izquierda.girar(jugadorN)
			izquierda.mover(jugadorN)
		})
		keyboard.right().onPressDo({ derecha.girar(jugadorN)
			derecha.mover(jugadorN)
		})
		keyboard.control().onPressDo({ arriba.girar(jugadorN)
			nivel2.crearBala()
		})
	}

	method asignarMovPlayer2Nivel2(jugadorN) {
		keyboard.a().onPressDo({ izquierda.girar(jugadorN)
			izquierda.mover(jugadorN)
		})
		keyboard.d().onPressDo({ derecha.girar(jugadorN)
			derecha.mover(jugadorN)
		})
		keyboard.g().onPressDo({ arriba.girar(jugadorN)
			nivel2.crearBala()
		})
	}

	method hablar(ente) {
		keyboard.x().onPressDo({ ente.mensajeRandom()})
	}

	method presionarEnter(presentacion) {
		keyboard.enter().onPressDo({ presentacion.continuar()})
	}

}

object fisicas {//<-------------new

	method colisiones(jugadores) {
		jugadores.forEach({unJugador => game.onCollideDo(unJugador, {algo => algo.teEncontro(unJugador)})})
	}

	method colisionesBala(zombies){
		//zombies.forEach({unZombie => game.onCollideDo(unZombie,{bala=>bala.mayorPrioridadColiciones(zombies)})})
		game.onCollideDo(zombies,{bala=>bala.mayorPrioridadColiciones(zombies)})
		
	}

	method colisionNivel2(unaBala, unZombie) {
		if (unaBala.position() == unZombie.position()) {
			game.removeVisual(unaBala)
			game.removeVisual(unZombie)
		}
	}

}

