import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*
import niveles.*

object teclado {

	method asignarFlechasPara(jugadorN) {
		keyboard.left().onPressDo({
			izquierda.girar(jugadorN)
			izquierda.moverLimitado(jugadorN)
		})
		keyboard.right().onPressDo({
			derecha.girar(jugadorN)
			derecha.moverLimitado(jugadorN)
		})
		keyboard.up().onPressDo({
			arriba.girar(jugadorN)
			arriba.moverLimitado(jugadorN)
		})
		keyboard.down().onPressDo({
			abajo.girar(jugadorN)
			abajo.moverLimitado(jugadorN)
		})
	}

	method asignarWASDPara(jugadorN) {
		keyboard.a().onPressDo({
			izquierda.girar(jugadorN)
			izquierda.moverLimitado(jugadorN)
		})
		keyboard.d().onPressDo({
			derecha.girar(jugadorN)
			derecha.moverLimitado(jugadorN)
		})
		keyboard.w().onPressDo({
			arriba.girar(jugadorN)
			arriba.moverLimitado(jugadorN)
		})
		keyboard.s().onPressDo({
			abajo.girar(jugadorN)
			abajo.moverLimitado(jugadorN)
		})
	}

	method asignarMovPlayer1Nivel2(jugadorN) {
		keyboard.left().onPressDo({
			izquierda.girar(jugadorN)
			izquierda.moverLimitado(jugadorN)
		})
		keyboard.right().onPressDo({
			derecha.girar(jugadorN)
			derecha.moverLimitado(jugadorN)
		})
		keyboard.control().onPressDo({
			arriba.girar(jugadorN)
			nivel2.crearBala()
		})
	}

	method asignarMovPlayer2Nivel2(jugadorN) {
		keyboard.a().onPressDo({
			izquierda.girar(jugadorN)
			izquierda.moverLimitado(jugadorN)
		})
		keyboard.d().onPressDo({
			derecha.girar(jugadorN)
			derecha.moverLimitado(jugadorN)
		})
		keyboard.g().onPressDo({
			arriba.girar(jugadorN)
			nivel2.crearBala()
		})
	}

	method hablar(ente) {
		keyboard.x().onPressDo({ ente.mensajeRandom() })
	}

	method presionarEnter(presentacion) {
		keyboard.enter().onPressDo({ nivel2.presentacion() })
	}

}

object fisicas {

	method colisiones(jugadores) {
		jugadores.forEach({unJugador => game.onCollideDo(unJugador, {algo => algo.teEncontro(unJugador)})})
	}

	method colisionesBala(zombies){
		game.onCollideDo(zombies,{bala=>bala.mayorPrioridadColiciones(zombies)})
		
	}

	method colisionNivel2(unaBala, unZombie) {
		if (unaBala.position() == unZombie.position()) {
			game.removeVisual(unaBala)
			game.removeVisual(unZombie)
		}
	}

}

