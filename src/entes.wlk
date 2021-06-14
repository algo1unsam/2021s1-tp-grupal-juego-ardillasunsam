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

	method image() = grafico

	method estaVivo() = (vidas > 0)
	
	method bajarVida() { 
		if (self.estaVivo()) {
			self.vidas(self.vidas()-1)
		}
	}
	
	method prioridadColisiones() = 0

	method colisionar(alguien) {}

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
		if (not self.girarEnEjeX()) {
			if (not self.girarEnEjeY()) {
				self.puntoAlcanzado(tipoDeMovimiento)
			}
		}
		self.direccion().mover(self)
	}

	method girarEnEjeX() {
		if (self.position().x() < self.puntoX(puntoActual)) {
			derecha.girar(self)
			return true
		} else if (self.position().x() > self.puntoX(puntoActual)) {
			izquierda.girar(self)
			return true
		} else {
			return false
		}
	}

	method girarEnEjeY() {
		if (self.position().y() > self.puntoY(puntoActual)) {
			abajo.girar(self)
			return true
		} else if (self.position().y() < self.puntoY(puntoActual)) {
			arriba.girar(self)
			return true
		} else {
			return false
		}
	}

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
		if (not alguien.estaVivo()) {			
			perdiste.iniciar()
		}
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
		if (alguien.herramientas().size() == 4) {
			game.say(self, "GANASTE")			
			game.removeVisual(alguien)
			self.movimiento()
		} else {
			super(alguien)
		}
	}
	method movimiento(){
		game.onTick(500,'mover', {
			if (self.position().x() == 0){
				game.schedule(2000, { nivel2.iniciar()} ) 
			}
			izquierda.mover(self)
		} )
	}

}
class Avion inherits Camioneta{
	
	override method colisionar(alguien){
		if (alguien.prioridadColisiones() == 40) {
			game.say(self, "Llegaste!!!")
			alguien.position(game.at(300, 300))
			game.removeVisual(alguien)
			self.movimiento()
		}
	}
	
	override method movimiento(){
		game.onTick(500,'mover Avion', {
			if (self.position().y() == 10){
				game.schedule(2000, { final.iniciar()} ) 
			}
			arriba.mover(self)
		} )
	}
}


class BarraVida inherits Ente {

	var property jugador

	override method prioridadColisiones() = 100

	override method image() = (self.grafico() + jugador.vidas().toString() + ".png")

}

class Bala inherits EnteBot {
	
	const diferentesImagenes = ["bullet_azul.png",
								"bullet_celeste.png",
								"bullet_gris.png",
								"bullet_naranja.png",
								"bullet_roja.png",
								"bullet_verde.png",
								"bullet_violeta.png"]

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
			self.vidas(self.vidas()-1)
		}
		if (not self.estaVivo()) {
			self.position(game.at(game.width(),game.height()))
		}
	}

}

class Zombie inherits EnteMalvado {

	const diferentesImagenes = [ "zombie1", 
								 "zombie2", 
	  							 "zombie3", 
								 "zombie4", 
								 "devil1", 
								 "devil2", 
								 "devil3",
								 "devil4" ]
								 
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
			self.vidas(self.vidas()-1)
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
		return game.at((0 .. game.width() - 1 ).anyOne(), game.height() - 1)
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

object randomNave {
	
	method position(){
		return game.at((0 .. 14 - 1 ).anyOne(), 0)
	}
}



class Fondo inherits Ente {
	override method prioridadColisiones() = 100
}