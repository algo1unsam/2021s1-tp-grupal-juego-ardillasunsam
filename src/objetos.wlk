import wollok.game.*
import jugador.*
import mecanicas.*
import niveles.*
import direcciones.*

class Ente {

	var property muerto = false
	var property position
	var property direccion = derecha
	var property grafico
	var property tiempo
	var property limitesMovimiento

	method image() = grafico

}

class EnteMalvado inherits Ente {

	method teEncontro(alguien) {
		if (alguien.vidas() > 0) {
			alguien.bajarVida()
			alguien.gritar()
			alguien.position(game.origin())
		} else {
			alguien.muerto(true)
			game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
			game.schedule(3500, { game.stop()})
		}
	}

}

class Enemigo inherits EnteMalvado {

	method movimientoX() {
		if (not self.colisionoConJugador(nivel1.jugadores())) {
			if (self.direccion() == derecha) {
				derecha.mover(1, self)
				if (position.x() == limitesMovimiento.last()) {
					izquierda.girar(self)
				}
			}
			if (self.direccion() == izquierda) {
				izquierda.mover(1, self)
				if (position.x() == limitesMovimiento.first()) {
					derecha.girar(self)
				}
			}
		}
	}
//---------------------------------------------new------------------------------
	method movimientoY() {
		if (not self.colisionoConJugador(nivel1.jugadores())) {
			if (self.direccion() == arriba) {
				arriba.mover(1, self)
				if (position.y() == limitesMovimiento.last()) {
					abajo.girar(self)
				}
			}
			if (self.direccion() == abajo) {
				abajo.mover(1, self)
				if (position.y() == limitesMovimiento.first()) {
					arriba.girar(self)
				}
			}
		}
	}
//---------------------------------------------------------------------------

	override method image() = ( self.grafico() + "_" + self.direccion() + ".png")

//------------------------------------------------------------se podra unificar en uno solo?¡?¡
	method eventoMovimientoX() {
		self.direccion(derecha)
		game.onTick(self.tiempo(), "MOVIMIENTO", { self.movimientoX()})
	}

	method eventoMovimientoY() {
		self.direccion(abajo)
		game.onTick(self.tiempo(), "MOVIMIENTO", { self.movimientoY()})
	}

	/*
	 *  	method eventoMovimiento(eje,direccion){
	 * 		self.direccion(direcion)
	 * 		game.onTick(self.tiempo(),"MOVIMIENTO",{self.movimiento.eje()})
	 * 	}?¡?¡
	 */
//----------------------------------------------------------------------------------------------------
	method colisionoConJugador(jugadores) {
		return jugadores.all({ unJugador => position == unJugador.position() })
	}

}

class Camioneta inherits objetos.Ente {

	method teEncontro(alguien) {
		game.say(self, "GANASTE")
		game.schedule(1000, { game.stop()})
	// nivel2.iniciar() estamos viendo como 
	}

}

class Bloque inherits objetos.Ente {

	method teEncontro(alguien) {
		(alguien.direccion()).contrario(1, alguien)
	}

}


