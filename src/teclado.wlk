import wollok.game.*
import direcciones.*
import niveles.*

object teclado {

	method moverYFlechaArribaAbajo(jugador) {
		keyboard.up().onPressDo({ arriba.girar(jugador)
			arriba.moverLimitado(jugador)
		})
		keyboard.down().onPressDo({ abajo.girar(jugador)
			abajo.moverLimitado(jugador)
		})
	}

	method moverXFlechaDerechaIzquierda(jugador) {
		keyboard.left().onPressDo({ izquierda.girar(jugador)
			izquierda.moverLimitado(jugador)
		})
		keyboard.right().onPressDo({ derecha.girar(jugador)
			derecha.moverLimitado(jugador)
		})
	}
	
	method girarArriba(jugador){
		keyboard.up().onPressDo({ arriba.girar(jugador)})		
	}

	method moverYTeclaWS(jugador) {
		keyboard.w().onPressDo({ arriba.girar(jugador)
			arriba.moverLimitado(jugador)
		})
		keyboard.s().onPressDo({ abajo.girar(jugador)
			abajo.moverLimitado(jugador)
		})
	}

	method moverXTeclaAD(jugador) {
		keyboard.a().onPressDo({ izquierda.girar(jugador)
			izquierda.moverLimitado(jugador)
		})
		keyboard.d().onPressDo({ derecha.girar(jugador)
			derecha.moverLimitado(jugador)
		})
	}

	method dispararTeclaCTRL(jugador) {
		var cargador=30
		keyboard.control().onPressDo({if(cargador>0){
			cargador--
			if(cargador==15){game.say(jugador, "quedan 15 balas, apunta mejor")}
			nivel2.crearBala()}else{game.say(jugador, "te quedaste sin balas :(")}
		})
	}

	method dispararTeclaG(jugador) {
		keyboard.g().onPressDo({ arriba.girar(jugador)
			nivel2.crearBala()
		})
	}

	method hablarTeclaX(objeto) {
		keyboard.x().onPressDo({ objeto.mensajeRandom()})
	}

	method presentacionTeclaEnter(nivel) {
		keyboard.enter().onPressDo({ nivel.iniciar()})
	}

}

