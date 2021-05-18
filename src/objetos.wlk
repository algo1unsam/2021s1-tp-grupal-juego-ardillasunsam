import wollok.game.*
import jugador.*
import mecanicas.*
import niveles.*


class Objeto
{
	var property muerto = false	
	var property position
	var property direccion = "derecha"
	var property grafico
	
	method image() = grafico
	
	method moverArriba(distanciaY) 
	{
		if ((position.y() < (game.height()-1)) and (not muerto)) {
			position = position.up(distanciaY)
		}
	}
	
	method moverAbajo(distanciaY)
	{
		if ((position.y() > 0) and (not muerto)) {
			position = position.down(distanciaY)
		}
	}
	
	method moverDerecha(distanciaX)
	{
		if ((position.x() < (game.width()-1)) and (not muerto)) {
			position = position.right(distanciaX)
		}
	}
	
	method moverIzquierda(distanciaX)
	{
		if ((position.x() > 0) and (not muerto)) {
			position = position.left(distanciaX)
		}
	}
	
	method girarArriba()
	{
		if (not muerto) {
			direccion = "arriba"
		}	
	}
	
	method girarAbajo()
	{
		if (not muerto) {
			direccion = "abajo"
		}
	}
	
	method girarDerecha()
	{
		if (not muerto) {
			direccion = "derecha"
		}	
	}
	
	method girarIzquierda()
	{
		if (not muerto) {
			direccion = "izquierda"
		}
	}
}


class ObjetoMalvado inherits Objeto
{
	method teEncontro(alguien) {
		if (alguien.vidas()>0){
			alguien.bajarVida()
			alguien.gritar()
		}
		else {
		alguien.muerto(true)
		game.say(self, "¡¡GAME OVER JAJAJAJAJ!!")
		game.schedule(3500, { game.stop()})
		
		}
	}
}


class Enemigo inherits ObjetoMalvado
{
	method movimiento() {
		if (not self.colisionoConJugador(nivel1.jugadores())) {  /* aplicar polimorfismo a los niveles */
			if (self.direccion() == "derecha") {
				self.moverDerecha(1)
				if (position.x() == 9) {   /* nose porque se frenan si pongo 10 */
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
	
	override method image() = ( self.grafico() + "_" + self.direccion() + ".png")

	method eventoMovimiento() {
		game.onTick(300, "MOVIMIENTO", { self.movimiento()}) 
	}

	method colisionoConJugador(jugadores) {
		return jugadores.all({ unJugador => position == unJugador.position() })
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
class Bloque inherits Objeto{
	
	method teEncontro(alguien){
		if (alguien.direccion() == 'derecha'){
			alguien.moverIzquierda(1)
		} else if(alguien.direccion() == 'izquierda' ){
			alguien.moverDerecha(1)
		} else if (alguien.direccion() == 'arriba'){
			alguien.moverAbajo(1)
		} else alguien.moverArriba(1)
	}
	
}