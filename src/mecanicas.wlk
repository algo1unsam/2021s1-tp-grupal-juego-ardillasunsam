import wollok.game.*
import objetos.*
import jugador.*

object config {

	method asignarFlechasPara(jugadorN) 
	{
		keyboard.left().onPressDo({ jugadorN.cambiarGeorge(left)})
		keyboard.right().onPressDo({ jugadorN.cambiarGeorge(right)})
		keyboard.up().onPressDo({ jugadorN.cambiarGeorge(up)})
		keyboard.down().onPressDo({ jugadorN.cambiarGeorge(down)})
	}
	
	method asignarWASDPara(jugadorN) 
	{
		keyboard.a().onPressDo({ jugadorN.cambiarGeorge(left)})
		keyboard.d().onPressDo({ jugadorN.cambiarGeorge(right)})
		keyboard.w().onPressDo({ jugadorN.cambiarGeorge(up)})
		keyboard.s().onPressDo({ jugadorN.cambiarGeorge(down)})
	}

	method configurarColisiones() {
		game.onCollideDo(jugador, { algo => algo.teEncontro(jugador)})
	}


	method DetenerEventosTiempo(evento) {
		game.removeTickEvent(evento)
	}

}

