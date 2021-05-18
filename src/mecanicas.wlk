import wollok.game.*
import objetos.*
import jugador.*

object config {

	method asignarFlechasPara(jugadorN) 
	{
		keyboard.left().onPressDo({jugadorN.girarIzquierda()
			                       jugadorN.moverIzquierda(1)})
		keyboard.right().onPressDo({jugadorN.girarDerecha()
			                        jugadorN.moverDerecha(1)})
		keyboard.up().onPressDo({jugadorN.girarArriba()
			                     jugadorN.moverArriba(1)})
		keyboard.down().onPressDo({jugadorN.girarAbajo()
			                       jugadorN.moverAbajo(1)})
	}
	
	method asignarWASDPara(jugadorN) 
	{
		keyboard.a().onPressDo({jugadorN.girarIzquierda()
			                    jugadorN.moverIzquierda(1)})
		keyboard.d().onPressDo({jugadorN.girarDerecha()
			                    jugadorN.moverDerecha(1)})
		keyboard.w().onPressDo({jugadorN.girarArriba()
			                    jugadorN.moverArriba(1)})
		keyboard.s().onPressDo({jugadorN.girarAbajo()
			                    jugadorN.moverAbajo(1)})
	}

	method configurarColisiones(jugadores) {
		jugadores.forEach({ unJugador => game.onCollideDo(unJugador, { algo => algo.teEncontro(unJugador)}) })
	}


	method DetenerEventosTiempo(evento) {
		game.removeTickEvent(evento)
	}

}

