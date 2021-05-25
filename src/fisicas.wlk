import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*
import niveles.*

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

