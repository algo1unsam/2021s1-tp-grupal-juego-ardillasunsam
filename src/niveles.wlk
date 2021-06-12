import fisicas.*
import wollok.game.*
import entes.*
import jugador.*
import direcciones.*
import teclado.*


object inicio {

	method iniciar() {
		self.configurarPantalla()
		teclado.presentacionTeclaEnter(nivel1)
		game.start()
	}

	method configurarPantalla(){
		game.title("ZOMBIES AND DEMONS")
		game.height(12)
		game.width(20)
		const principal = new Ente(grafico = "principal1.png")
		game.addVisual(principal)
	}

}

class Nivel {

	const jugadores = []
	const objetos = []

	method jugadores() = jugadores

	method agregarJugador(jugadorPosicion, jugadorGrafico) {
		if (jugadores.size() > 2) {
			self.error("maxima cantidad de 
                        jugadores alcanzado.")
		}

		jugadores.add(new Jugador(position = jugadorPosicion, grafico = jugadorGrafico, vidas = 3))

		self.asignarTeclas()
	}
	
	method asignarTeclas() {
		if (jugadores.size() == 1) {
			teclado.moverXFlechaDerechaIzquierda(jugadores.first())
			teclado.moverYFlechaArribaAbajo(jugadores.first())
		} else {
			teclado.moverXTeclaAD(jugadores.last())
			teclado.moverYTeclaWS(jugadores.last())
		}
		teclado.hablarTeclaX(jugadores.last())
	}
	
	method iniciar() {
		game.clear()
		self.iniciarPresentacion()
		game.schedule(5000, {
			game.clear()
			
			// Iniciado de los elementos del nivel por capas.
			self.iniciarFondo()
			self.iniciarBloques()
			self.iniciarZombies()
			self.iniciarJugadores()
			self.iniciarOtrosElementos()
			self.iniciarAnimaciones()
			
			objetos.addAll(jugadores)
			objetos.forEach({ unObjeto => game.addVisual(unObjeto) })
			
			fisicas.colisionesEntreTodos(objetos)
			game.schedule(10000, {self.iniciarExtras()})
		})
		
	}
	
	method iniciarPresentacion() {}
	method iniciarFondo() {}
	method iniciarBloques() {}
	method iniciarZombies() {}
	method iniciarJugadores() {}
	method iniciarOtrosElementos() {}
	method iniciarAnimaciones() {
	objetos.add(new BarraVida(jugador = jugadores.last(), position = game.at(14, 0), grafico = "barra_red"))
	
	}
	method iniciarExtras(){}
}

object nivel1 inherits Nivel {

	override method iniciarPresentacion() {
		const presentacionNivel1 = new Ente(grafico = "nivel1.png")
		game.addVisual(presentacionNivel1)
	}

	override method iniciarFondo() {
		objetos.add(new Fondo(grafico = "fondo_nivel1.jpg"))
	}

	override method iniciarBloques() {
		objetos.add(new Bloque(position = game.at(0, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(1, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(2, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(3, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(4, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(7, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(8, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(9, 4), grafico = "valla.png"))
		objetos.add(new Bloque(position = game.at(9, 2), grafico = "muro.png"))
		objetos.add(new Bloque(position = game.at(9, 1), grafico = "muro.png"))
		objetos.add(new Bloque(position = game.at(9, 0), grafico = "muro.png"))
		objetos.add(new Bloque(position = game.at(8, 9), grafico = "autoTracero.png"))

		const alcantarilla1 = new Alcantarilla(position = game.at(2, 2), grafico = "alcantarilla.png")
		const alcantarilla2 = new Alcantarilla(position = game.at(6, 6), grafico = "alcantarilla.png")
		
		alcantarilla1.salida(alcantarilla2)
		alcantarilla2.salida(alcantarilla1)
		
		objetos.add(alcantarilla1)
		objetos.add(alcantarilla2)
	}

	override method iniciarZombies() {
		 
		const zombies = []
		
		zombies.add(new Zombie(position = game.at(5, 9)))
		zombies.last().agregarPunto(5, 5) // recto eje y

		zombies.add(new Zombie(position = game.at(7, 6)))
		zombies.last().agregarPunto(6, 7) // cuadrado

		zombies.add(new Zombie(position = game.at(10, 8)))
		zombies.last().agregarPunto(10, 2) // recto eje y

		zombies.add(new Zombie(position = game.at(13, 8)))
		zombies.last().agregarPunto(13, 3) // recto eje y

		zombies.add(new Zombie(position = game.at(15, 10)))
		zombies.last().agregarPunto(11, 5) // cuadrado

		zombies.add(new Zombie(position = game.at(10, 3)))
		zombies.last().agregarPunto(16, 3) // recto eje x

		zombies.add(new Zombie(position = game.at(1, 6)))	
		zombies.last().agregarPunto(3, 11) // cuadrado

		zombies.add(new Zombie(position = game.at(17, 11)))
		zombies.last().agregarPunto(17, 3) // recto eje y

		zombies.add(new Zombie(position = game.at(6, 11)))
		zombies.last().agregarPunto(13, 11) // recto eje x

		zombies.forEach({ unZombie => unZombie.iniciarMovimiento("ciclico", 100.randomUpTo(400))})
		
		objetos.addAll(zombies)
		
		
	}

	override method iniciarJugadores() {
		self.agregarJugador(game.origin(), "george")
		teclado.mostrarCoordenadaTeclaH(jugadores.last())
	}
	
	override method iniciarOtrosElementos() {
		objetos.add(new Camioneta(position = game.at(7, 9), grafico = "camioneta.png"))
		objetos.add(new Ente(position = game.at(15, 1), grafico = 'rueda.png'))
		objetos.add(new Ente(position = game.at(18, 6), grafico = 'Herramienta.png'))
		objetos.add(new Ente(position = game.at(14, 10), grafico = 'bidon.png'))
		objetos.add(new Ente(position = game.at(4, 11), grafico = 'tuerca.png'))
	}
 
}

object nivel2 inherits Nivel {
	
	override method iniciarExtras(){
		const avion = new Avion(position = game.at(12, 0), grafico = "avion.png")
		game.addVisual(avion)
	}
	
	override method iniciarPresentacion() {
		const presentacionNivel2 = new Ente(grafico = "nivel2.png")
		game.addVisual(presentacionNivel2)
	}
	
	override method iniciarFondo() {
		objetos.add(new Fondo(grafico = "fondo_nivel2.jpg"))
	}
	
	override method iniciarBloques() {
		objetos.add(new Bloque(position = game.at(8, 9), grafico = "autoTracero.png"))
	}

	override method iniciarZombies() {
		game.onTick(400, "CREAR_ZOMBIE", {
			const zombie = new Zombie(position = randomZombie.position())
			game.addVisual(zombie)
			self.movimientoZombie(zombie)
			fisicas.colisiones(zombie)
		})
	}
	
	override method iniciarJugadores() {
		self.agregarJugador(game.origin(), "george")
		teclado.mostrarCoordenadaTeclaH(jugadores.last())
	}
	
	override method iniciarOtrosElementos() {
		//const avion = new Avion(position = game.at(1, 2), grafico = "avion.png")
		// La camioneta bloquea a los zombies y envia un mensaje de error.
		//objetos.add(new Camioneta(position = game.at(7, 9), grafico = "camioneta.png"))
	}

	

	override method asignarTeclas() {
		if (jugadores.size() == 1) {
			teclado.moverXFlechaDerechaIzquierda(jugadores.first())
			teclado.dispararTeclaCTRL(jugadores.first())
		} else {
			teclado.moverXTeclaAD(jugadores.last())
			teclado.dispararTeclaG(jugadores.first())
		}
		teclado.hablarTeclaX(jugadores.last())
	}

	// hay que lograr que acepte los dos jugadores
	// hay que reemplazar por las mecanicas existentes de puntos.
	method crearBala() {
		const bala = new Bala(position = jugadores.first().position().up(1))
		game.addVisual(bala)
		
		game.onTick(15, bala.identity().toString(), {
			if (bala.position().y() == game.height()) {
				game.removeVisual(bala)
				game.removeTickEvent(bala.identity().toString())
			}
			arriba.mover(bala)
		})
		
		fisicas.colisiones(bala)
	}

	method movimientoZombie(unZombie) {
		game.onTick(1000, self.identity().toString(), {
			if (unZombie.position().y() == 0) {
				unZombie.position(randomZombie.position())
			}
			abajo.mover(unZombie)
		})
	}
}

object final{
	method iniciar(){
		game.clear()
		const final = new Ente(grafico = "final.png")
		game.addVisual(final)
		game.schedule(5000, {game.stop()})
	}
}

object perdiste{
	method iniciar(){
		game.clear()
		const perdiste = new Ente(grafico = "gameover.png")
		game.addVisual(perdiste)
		game.schedule(5000, {game.stop()})
	}
}
