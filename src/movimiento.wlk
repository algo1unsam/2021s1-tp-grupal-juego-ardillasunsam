import wollok.game.*
import enemigos.*
import personaje.*

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ personaje.cambiarGeorge(left)})
		keyboard.right().onPressDo({ personaje.cambiarGeorge(right)})
		keyboard.up().onPressDo({ personaje.cambiarGeorge(up)})
		keyboard.down().onPressDo({ personaje.cambiarGeorge(down)})
	}

	method configurarColisiones() {
		game.onCollideDo(personaje, { algo => algo.teEncontro(personaje)})
	}

	method configurarGravedad() {
	// game.onTick(0, "GRAVEDAD", { pepita.caerSiEstasVolando()})
	}

	method DetenerEventosTiempo(evento) {
		game.removeTickEvent(evento)
	}



}

object tutorial {

	method iniciar() {
		game.addVisual(personaje)
		config.configurarTeclas()
		config.configurarColisiones()
		const dragon1 = new Enemigo(position = game.center(), grafico = "zombie.png")
		const dragon2 = new Enemigo(position = game.at(2, 7), grafico = "devil.png")
		const trampa1 = new Trampa(position = game.at(3, 8), grafico = "Slime.png")
		const trampa2  = new Trampa(position = game.at(6, 3), grafico = "Slime.png")
		game.addVisual(trampa1)
		game.addVisual(trampa2)
		game.addVisual(dragon1)
		game.addVisual(dragon2)
		dragon1.eventoMovimiento() // este esta fallando
		dragon2.eventoMovimiento()
	}

}

