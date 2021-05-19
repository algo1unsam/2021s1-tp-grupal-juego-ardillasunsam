import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*

object config {

	method asignarFlechasPara(jugadorN) 
	{
		keyboard.left().onPressDo({izquierda.girar(jugadorN)
			                       izquierda.mover(1, jugadorN)})
		keyboard.right().onPressDo({derecha.girar(jugadorN)
			                       derecha.mover(1, jugadorN)})
		keyboard.up().onPressDo({arriba.girar(jugadorN)
			                     arriba.mover(1,jugadorN )})
		keyboard.down().onPressDo({abajo.girar(jugadorN)
			                       abajo.mover(1,jugadorN)})
	}
	
	method asignarWASDPara(jugadorN) 
	{
		keyboard.a().onPressDo({izquierda.girar(jugadorN)
			                       izquierda.mover(1, jugadorN)})
		keyboard.d().onPressDo({derecha.girar(jugadorN)
			                       derecha.mover(1, jugadorN)})
		keyboard.w().onPressDo({arriba.girar(jugadorN)
			                     arriba.mover(1,jugadorN )})
		keyboard.s().onPressDo({abajo.girar(jugadorN)
			                       abajo.mover(1,jugadorN)})
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

