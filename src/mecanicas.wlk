import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*

object config {

	method asignarFlechasPara(jugadorN) 
	{
		keyboard.left().onPressDo({izquierda.girarIzquierda(jugadorN)
			                       izquierda.moverIzquierda(1, jugadorN)})
		keyboard.right().onPressDo({derecha.girarDerecha(jugadorN)
			                       derecha.moverDerecha(1, jugadorN)})
		keyboard.up().onPressDo({arriba.girarArriba(jugadorN)
			                     arriba.moverArriba(1,jugadorN )})
		keyboard.down().onPressDo({abajo.girarAbajo(jugadorN)
			                       abajo.moverAbajo(1,jugadorN)})
	}
	
	method asignarWASDPara(jugadorN) 
	{
		keyboard.a().onPressDo({izquierda.girarIzquierda(jugadorN)
			                       izquierda.moverIzquierda(1, jugadorN)})
		keyboard.d().onPressDo({derecha.girarDerecha(jugadorN)
			                       derecha.moverDerecha(1, jugadorN)})
		keyboard.w().onPressDo({arriba.girarArriba(jugadorN)
			                     arriba.moverArriba(1,jugadorN )})
		keyboard.s().onPressDo({abajo.girarAbajo(jugadorN)
			                       abajo.moverAbajo(1,jugadorN)})
	}
	
	method hablar(jugadorN){
		keyboard.x().onPressDo({jugadorN.mensajeRandom()})
	}
	

	method configurarColisiones(jugadores) {
		jugadores.forEach({ unJugador => game.onCollideDo(unJugador, { algo => algo.teEncontro(unJugador)}) })
		
	}


	method DetenerEventosTiempo(evento) {
		game.removeTickEvent(evento)
	}

}

