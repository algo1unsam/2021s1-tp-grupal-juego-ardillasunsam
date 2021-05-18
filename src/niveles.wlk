import mecanicas.*
import wollok.game.*
import objetos.*
import jugador.*


class Niveles {
	const jugadores = []
	
	method jugadores()
	{
		return jugadores
	}
	
	method agregarJugador(jugadorPosicion, jugadorGrafico)
	{
		if (jugadores.size() > 2) {
			self.error("maxima cantidad de jugadores alcanzado.")
		}
		
		jugadores.add(new Jugador(position = jugadorPosicion, grafico = jugadorGrafico))
		game.addVisual(jugadores.last())
		
		if (jugadores.size() == 1) {
			config.asignarFlechasPara(jugadores.first())
			config.hablar(jugadores.first())
		} else {
			config.asignarWASDPara(jugadores.last())
			config.hablar(jugadores.last())
		}
	}
	
	method iniciar() {}
}


object nivel1 inherits Niveles {
	override method iniciar() {
		game.boardGround("fondo_carretera.png")
		
		self.agregarJugador(game.origin(), "george")
		
		//Con esta linea, funciona bien el multijugador,
		//pero se bugea el mensaje.
		//self.agregarJugador(game.origin(), "george")
		 
		config.configurarColisiones(jugadores)

		const dragon1 = new Enemigo(position = game.center(), grafico = 'zombie')
		const dragon2 = new Enemigo(position = game.at(2, 7), grafico = 'blanca')
		const trampa1 = new ObjetoMalvado(position = game.at(3, 8), grafico = "Slime.png")
		const trampa2 = new ObjetoMalvado(position = game.at(6, 3), grafico = "Slime.png")
		const navePortal = new NavePortal(position = game.at(9, 9), grafico = "navePortal.png")
		const bloque = new Bloque(position = game.at(0,1), grafico ="muro.png" )
		const bloque1 = new Bloque(position = game.at(1,1), grafico ="muro.png" )
		const bloque2 = new Bloque(position = game.at(2,1), grafico ="muro.png" )
		const bloque3 = new Bloque(position = game.at(3,1), grafico ="muro.png" )
		const bloque4 = new Bloque(position = game.at(4,1), grafico ="muro.png" )
		game.addVisual(trampa1)
		game.addVisual(trampa2)
		game.addVisual(dragon1)
		game.addVisual(dragon2)
		game.addVisual(navePortal)
		game.addVisual(bloque)
		game.addVisual(bloque1)
		game.addVisual(bloque2)
		game.addVisual(bloque3)
		game.addVisual(bloque4)
		dragon1.eventoMovimiento() 
		dragon2.eventoMovimiento()
	}
}


/*object nivel2 {   estamos viendo como imitar a estonoescocapapi
      
	    method iniciar() {
		game.boardGround("fondoEspacial.png")
		game.addVisual(jugador)
		config.configurarTeclas()
		config.configurarColisiones()
		const dragon1 = new Enemigo(position = game.center(), grafico = "zombie.png")
		const dragon2 = new Enemigo(position = game.at(2, 7), grafico = "devil.png")
		const trampa1 = new Trampa(position = game.at(3, 8), grafico = "Slime.png")
		const trampa2 = new Trampa(position = game.at(6, 3), grafico = "Slime.png")
		const navePortal = new NavePortal(position = game.at(9, 9), grafico = "navePortal.png")
		game.addVisual(trampa1)
		game.addVisual(trampa2)
		game.addVisual(dragon1)
		game.addVisual(dragon2)
		game.addVisual(navePortal)
		dragon1.eventoMovimiento() // este esta fallando
		dragon2.eventoMovimiento()
	}
}*/