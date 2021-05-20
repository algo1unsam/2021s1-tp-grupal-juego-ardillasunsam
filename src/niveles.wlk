import mecanicas.*
import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*

class Presentacion{		
	method continuar(){
		game.stop() // aca deberia pasar a la proxima pantalla
					//por ahora finaliza el juego
	}
	
}

object inicio inherits Presentacion {
	method iniciar(){
		game.boardGround ("Principal.jpg")
		teclado.presionarEnter(self)
	}
}
class Niveles {

	const jugadores = []
	const zombies = []

	method jugadores() {
		return jugadores
	}

	method agregarJugador(jugadorPosicion,jugadorGrafico) {
		if (jugadores.size() > 2) {
			self.error("maxima cantidad de jugadores alcanzado.")
		}
		jugadores.add(new Jugador(position = jugadorPosicion, grafico = jugadorGrafico))
		game.addVisual(jugadores.last())
		if (jugadores.size() == 1) {
			teclado.asignarFlechasPara(jugadores.first())
		} else {
			teclado.asignarWASDPara(jugadores.last())
		}
		teclado.hablar(jugadores.last())
	}

//---------------------------------------new-------------------------------------	
	method agregarZombie(zombiePosicion, zombieGrafico, zombieTick, zombieLimites,eje) {
		zombies.add(new Enemigo(position = zombiePosicion, grafico = zombieGrafico, tiempo = zombieTick, limitesMovimiento = zombieLimites))
		game.addVisual(zombies.last())
		if(eje=="x"){zombies.last().eventoMovimientoX()}else{zombies.last().eventoMovimientoY()}
		
	}
//--------------------------------------------------------------------------

}


object nivel1 inherits Niveles {

	 method iniciar() {
		game.boardGround("fondo_carretera.png")
			// Con esta linea, funciona bien el multijugador,
			// pero se bugea el mensaje.
			// self.agregarJugador(game.origin(), "george")
		
			
//----------------------------new-------------------------------------------			
		self.agregarZombie(game.center(),'zombie', 100,[0,9],"x")
		self.agregarZombie(game.at(2,7), 'blanca', 300,[0,9],"x")
		self.agregarZombie(game.at(5,8), 'zombie', 500,[2,9],"x")
		self.agregarZombie(game.at(5,6), 'blanca', 150,[2,9],"y")
		self.agregarZombie(game.at(5,6), 'blanca', 150,[3,8],"x")
		self.agregarZombie(game.at(8,9), 'zombie', 350,[5,8],"y")
//-----------------------------------------------------------------------
		const trampa1 = new EnteMalvado(position = game.at(3, 8), grafico = "Slime.png",tiempo=300,limitesMovimiento=[0,0])
		const trampa2 = new EnteMalvado(position = game.at(6, 3), grafico = "Slime.png",tiempo=300,limitesMovimiento=[0,0])
		const camioneta = new Camioneta(position = game.at(7, 9), grafico = "camioneta.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque = new Bloque(position = game.at(0, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque1 = new Bloque(position = game.at(1, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque2 = new Bloque(position = game.at(2, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque3 = new Bloque(position = game.at(3, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque4 = new Bloque(position = game.at(4, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque5 = new Bloque(position = game.at(7, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque6 = new Bloque(position = game.at(8, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const bloque7 = new Bloque(position = game.at(9, 4), grafico = "valla.png",tiempo=300,limitesMovimiento=[0,0])
		const rueda = new Herramienta(position = game.at(2,2), grafico = 'rueda.png')
		const herramienta = new Herramienta(position = game.at(6,7), grafico = 'Herramienta.png')
		const bidon = new Herramienta(position = game.at(5,8), grafico = 'bidon.png')
		const tuerca = new Herramienta(position = game.at(9,3), grafico = 'tuerca.png')
		
	 	
	 	game.addVisual(trampa1)
		game.addVisual(trampa2)
		game.addVisual(camioneta)
		game.addVisual(bloque)
		game.addVisual(bloque1)
		game.addVisual(bloque2)
		game.addVisual(bloque3)
		game.addVisual(bloque4)
		game.addVisual(bloque5)
		game.addVisual(bloque6)
		game.addVisual(bloque7)
		game.addVisual(rueda)
		game.addVisual(herramienta)
		game.addVisual(bidon)
		game.addVisual(tuerca)
		


		self.agregarJugador(game.origin(), "george")
		fisicas.colisiones(jugadores)
	}

}

/*object nivel2 {   estamos viendo como imitar a estonoescocapapi
 *       
 * 	    method iniciar() {
 * 		game.boardGround("fondoEspacial.png")
 * 		game.addVisual(jugador)
 * 		config.configurarTeclas()
 * 		config.configurarColisiones()
 * 		const dragon1 = new Enemigo(position = game.center(), grafico = "zombie.png")
 * 		const dragon2 = new Enemigo(position = game.at(2, 7), grafico = "devil.png")
 * 		const trampa1 = new Trampa(position = game.at(3, 8), grafico = "Slime.png")
 * 		const trampa2 = new Trampa(position = game.at(6, 3), grafico = "Slime.png")
 * 		const navePortal = new NavePortal(position = game.at(9, 9), grafico = "navePortal.png")
 * 		game.addVisual(trampa1)
 * 		game.addVisual(trampa2)
 * 		game.addVisual(dragon1)
 * 		game.addVisual(dragon2)
 * 		game.addVisual(navePortal)
 * 		dragon1.eventoMovimiento() // este esta fallando
 * 		dragon2.eventoMovimiento()
 * 	}
 }*/


 
 