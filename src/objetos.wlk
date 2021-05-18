import wollok.game.*
import jugador.*
import mecanicas.*
import niveles.*
import direcciones.*


class Objeto
{
	var property muerto = false	
	var property position
	var property direccion = derecha
	var property grafico
	
	method image() = grafico
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
			if ( self.direccion() == derecha) {
				derecha.moverDerecha(1,self)
				//self.moverDerecha(1)
				if (position.x() == 9) {   /* nose porque se frenan si pongo 10 */
					izquierda.girarIzquierda(self)
					//self.girarIzquierda()
				}
			}
			if ( self.direccion() == izquierda) {
				//self.moverIzquierda(1)
				izquierda.moverIzquierda(1,self)
				if (position.x() == 0) {
					//self.girarDerecha()
					derecha.girarDerecha(self)
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
		if (alguien.direccion() == derecha){
			izquierda.moverIzquierda(1,alguien)
		} else if(alguien.direccion() == izquierda ){
			derecha.moverDerecha(1,alguien)
		} else if (alguien.direccion() == arriba){
			abajo.moverAbajo(1,alguien)
		} else arriba.moverArriba(1,alguien)
	}
	
}