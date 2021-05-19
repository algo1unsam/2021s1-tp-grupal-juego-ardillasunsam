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
	var property tiempo = 500
	var property limitesMovimiento = [0,10]

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
			self.direccion().mover(1, self)
			if (limitesMovimiento.any({ unLimite => unLimite == position.x() })) {
				self.direccion().direccionOpuesta().girar(self)
			}
		}
	}
//---------------------------------------------new------------------------------
	method movimientoY() {
		if (not self.colisionoConJugador(nivel1.jugadores())) {
			self.direccion().mover(1, self)
			if (limitesMovimiento.any({ unLimite => unLimite == position.y() })) {
				self.direccion().direccionOpuesta().girar(self)
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

class Camioneta inherits Ente {

	method teEncontro(alguien) {
		if (alguien.herramientas().size() == 4){
		game.say(self, "GANASTE")
		game.schedule(1000, { game.stop()})}
	// nivel2.iniciar() estamos viendo como 
	}

}

class Bloque inherits Ente {
	method teEncontro(alguien) {
		alguien.direccion().direccionOpuesta().girar(alguien)
		alguien.direccion().mover(1, alguien)
	}
}

class Herramienta inherits Ente{
	method teEncontro(alguien){
		alguien.agarrar(self)
		game.removeVisual(self)
	}
}


