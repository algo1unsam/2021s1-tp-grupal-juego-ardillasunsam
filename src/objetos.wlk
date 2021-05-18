import wollok.game.*
import jugador.*
import mecanicas.*


class Objeto
{
	var property position
	var property direccion = "derecha"
	var property grafico
	
	method image() = grafico
	
	method moverArriba(distanciaY) 
	{
		if (position.y() < (game.height()+distanciaY)) {
			position = position.up(distanciaY)
		}
	}
	
	method moverAbajo(distanciaY)
	{
		if (position.y() > (0-distanciaY)) {
			position = position.down(distanciaY)
		}
	}
	
	method moverDerecha(distanciaX)
	{
		if (position.x() < (game.width()+distanciaX)) {
			position = position.right(distanciaX)
		}
	}
	
	method moverIzquierda(distanciaX)
	{
		if (position.x() > (0-distanciaX)) {
			position = position.left(distanciaX)
		}
	}
	
	method girarArriba()
	{
		direccion = "arriba"
	}
	
	method girarAbajo()
	{
		direccion = "abajo"
	}
	
	method girarDerecha()
	{
		direccion = "derecha"
	}
	
	method girarIzquierda()
	{
		direccion = "izquierda"
	}
}


class ObjetoMalvado inherits Objeto
{
	method teEncontro(alguien) {
		alguien.image('sangre.png')
		alguien.muerto(1)
		game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
		
		game.schedule(3500, { game.stop()})
	}
}


class Enemigo inherits ObjetoMalvado
{
	method movimiento() {
		if (not self.colisionoConPersonaje()) {
			if (self.direccion() == "derecha") {
				self.moverDerecha(1)
				if (position.x() == 10) {
					self.girarIzquierda()
				}
			}
			if (self.direccion() == "izquierda") {
				self.moverIzquierda(1)
				if (position.x() == 0) {
					self.girarDerecha()
				}
			}
		}
	}

	method eventoMovimiento() {
		game.onTick(300, "MOVIMIENTO", { self.movimiento()}) 
	}

	method colisionoConPersonaje() {
		return position == jugador.position()
	}

}


class NavePortal inherits Objeto
{
	method teEncontro(alguien) {
		game.say(self, "GANASTE")
		game.schedule(1000, { game.stop()})
	// nivel2.iniciar() estamos viendo como 
	}

}