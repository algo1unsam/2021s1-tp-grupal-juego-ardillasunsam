import movimiento.*
import wollok.game.*
import objetos.*
import personaje.*

object nivel1 {
		
	    method iniciar() {
		game.boardGround("fondo_carretera.png")
		
		//const personaje = new Personaje(position = game.origin(), grafico = "george_down.png")
		game.addVisual(personaje)
		config.configurarTeclas()
		config.configurarColisiones()
		const dragon1 = new Enemigo(position = game.center(), grafico = "zombie.png")
		const dragon2 = new Enemigo(position = game.at(2, 7), grafico = "devil.png")
		const trampa1 = new ObjetoMalvado(position = game.at(3, 8), grafico = "Slime.png")
		const trampa2 = new ObjetoMalvado(position = game.at(6, 3), grafico = "Slime.png")
		const navePortal = new NavePortal(position = game.at(9, 9), grafico = "navePortal.png")
		game.addVisual(trampa1)
		game.addVisual(trampa2)
		game.addVisual(dragon1)
		game.addVisual(dragon2)
		game.addVisual(navePortal)
		dragon1.eventoMovimiento() 
		dragon2.eventoMovimiento()
	}
}

/*object nivel2 {   estamos viendo como imitar a estonoescocapapi
      
	    method iniciar() {
		game.boardGround("fondoEspacial.png")
		game.addVisual(personaje)
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