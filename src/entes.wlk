import wollok.game.*
import jugador.*
import fisicas.*
import niveles.*
import direcciones.*

class Ente {

	var property vidas = 1
	var property position = game.origin()
	var property direccion = abajo
	var property grafico = ""
	var property inventario = []

	method cantidadDeItems() = inventario.size()

	method agregarItemAlInventario(nuevoItem) {
		inventario.add(nuevoItem)
		game.removeVisual(nuevoItem)
	}

	method image() = grafico

	method estaVivo() = (vidas > 0)

	method bajarVida() {
		if (self.estaVivo()) {
			self.vidas(self.vidas() - 1)
		}
	}

	method prioridadColisiones() = 0

	method colisionar(alguien) {
	}
	
}

class EnteBot inherits Ente {

	var property puntoActual = 0
	var property puntos = []

	override method image() = (self.grafico() + "_" + self.direccion() + ".png")

	method agregarPunto(coordenadaX, coordenadaY) {
		puntos.add([ coordenadaX, coordenadaY ])
	}

	method iniciarMovimiento(tipoDeMovimiento, tiempo) {
		const aux = []
		aux.add([ self.position().x(), self.position().y() ])
		aux.addAll(puntos)
		puntos.clear()
		self.puntos(aux)
		game.onTick(tiempo, self.identity().toString(), { self.movimiento(tipoDeMovimiento)})
	}

	method puntoX(numeroDePunto) {
		return puntos.get(numeroDePunto).first()
	}

	method puntoY(numeroDePunto) {
		return puntos.get(numeroDePunto).last()
	}

	method movimiento(tipoDeMovimiento) {
		var puntoAlcanzado = true
		if (self.puntoXmenorAlActual()) {
			derecha.girar(self)
			puntoAlcanzado = false
		}
		if (self.puntoXmayorAlActual()) {
			izquierda.girar(self)
			puntoAlcanzado = false
		}
		if (self.puntoYmayorAlActual()) {
			abajo.girar(self)
			puntoAlcanzado = false
		}
		if (self.puntoYmenorAlActual()) {
			arriba.girar(self)
			puntoAlcanzado = false
		}
		if (not puntoAlcanzado) {
			self.direccion().mover(self)
		} else {
			self.puntoAlcanzado(tipoDeMovimiento)
		}
	}

	method puntoXmenorAlActual() = self.position().x() < self.puntoX(puntoActual)

	method puntoXmayorAlActual() = self.position().x() > self.puntoX(puntoActual)

	method puntoYmayorAlActual() = self.position().y() > self.puntoY(puntoActual)

	method puntoYmenorAlActual() = self.position().y() < self.puntoY(puntoActual)

	method puntoAlcanzado(tipoDeMovimiento) {
		if ((puntoActual + 1) == puntos.size()) {
			if (tipoDeMovimiento == "ciclico") {
				puntoActual = 0
			} else {
				game.removeTickEvent(self.identity().toString())
			}
		} else {
			puntoActual += 1
		}
	}

}

class EnteMalvado inherits EnteBot {

	override method colisionar(alguien) {
		alguien.bajarVida()
	}

}

class Bloque inherits Ente {

	override method prioridadColisiones() = 100

	override method colisionar(alguien) {
		alguien.direccion().direccionOpuesta().mover(alguien)
	}

}

class Camioneta inherits Bloque {

	override method colisionar(alguien) {
		if (alguien.cantidadDeItems() >= 4) {
			game.say(self, "EXELENTE UN ARAMA EN EL AUTO! :D")
			game.removeVisual(alguien)
			self.movimiento()
		} else {
			super(alguien)
		}
	}

	method movimiento() {
		game.onTick(500, 'mover', { if (self.position().x() == 0) {
				game.schedule(2000, { nivel2.iniciar()})
			}
			izquierda.mover(self)
		})
	}

}

class Avion inherits Camioneta {

	var pasajeros = 0

	override method colisionar(alguien) {
		if (alguien.prioridadColisiones() == 40) {
			game.removeVisual(alguien)
			alguien.position(game.at(300,300))
			pasajeros += 1
			if (pasajeros < 6) {
				game.say(self, "logra tiempo hasta que suban todos!")
			}

			if (pasajeros == 8) {
				game.say(self, "solo faltan 2 sigue asi!!!!")
				
			}			
			
			if (pasajeros == 10) {
				game.say(self, "LISTO! SUBE! SOLO FALTAS TU!")
				arriba.mover(self)
			}
			if (pasajeros == 11) {
				game.say(self, "SALVASTE A TODOS :D!!")
				self.movimiento()
				game.say(self, " listo , vamo al kiosoco :D ")
			}
		}
	}

	override method movimiento() {
		game.onTick(500, 'mover Avion', { if (self.position().y() == 10) {
				game.schedule(2000, { final.iniciar()})
			}
			arriba.mover(self)
		})
	}

}

class BarraVida inherits Ente {

	var property jugador

	override method prioridadColisiones() = 100

	override method image() = (self.grafico() + jugador.vidas().toString() + ".png")

}

class Bala inherits EnteBot {

	const diferentesImagenes = [ "bullet_azul.png", "bullet_celeste.png", "bullet_gris.png", "bullet_naranja.png", "bullet_roja.png", "bullet_verde.png", "bullet_violeta.png" ]

	override method image() {
		if (self.grafico() == "") {
			self.grafico(diferentesImagenes.anyOne())
		}
		return self.grafico()
	}

	override method prioridadColisiones() = 100

	override method colisionar(alguien) {
		alguien.bajarVida()
		self.bajarVida()
	}

	override method bajarVida() {
		// Estos IF deben permanecer separados.
		if (self.estaVivo()) {
			self.vidas(self.vidas() - 1)
		}
		if (not self.estaVivo()) {
			self.position(game.at(game.width(), game.height()))
		}
	}

}

class Zombie inherits EnteMalvado {

	const diferentesImagenes = [ "zombie1", "zombie2", "zombie3", "zombie4", "devil1", "devil2", "devil3", "devil4" ]

	override method prioridadColisiones() = 60

	override method image() {
		if (self.grafico() == "") {
			self.grafico(diferentesImagenes.anyOne())
		}
		return (self.grafico() + "_" + self.direccion() + ".png")
	}

	override method bajarVida() {
		// Estos IF deben permanecer separados.
		if (self.estaVivo()) {
			self.vidas(self.vidas() - 1)
		}
		if (not self.estaVivo()) {
			self.position(randomZombie.position())
			
		}
	}

}

class Alcantarilla inherits Ente {

	var property salida = self

	override method prioridadColisiones() = 60

	override method colisionar(alguien) {
		abajo.girar(alguien)
		alguien.position(salida.position())
	}

}

object randomZombie {

	method position() {
		return game.at((0 .. game.width()).anyOne(), game.height() + 1)
	}

	method emptyPosition() {
		const position = self.position()
		if (game.getObjectsIn(position).isEmpty()) {
			return position
		} else {
			return self.emptyPosition()
		}
	}
}

class Fondo inherits Ente {

	override method prioridadColisiones() = 100

}

