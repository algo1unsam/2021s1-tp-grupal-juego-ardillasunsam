import fisicas.*
import wollok.game.*
import objetos.*
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
		const principal = new Ente(grafico = "principal1.jpg")
		game.addVisual(principal)
	}

}

class Niveles {

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
		})
	}
	
	method iniciarPresentacion() {}
	method iniciarFondo() {}
	method iniciarBloques() {}
	method iniciarZombies() {}
	method iniciarJugadores() {}
	method iniciarOtrosElementos() {}
	method iniciarAnimaciones() {}
}

object nivel1 inherits Niveles {

	override method iniciarPresentacion() {
		const presentacionNivel1 = new Ente(grafico = "nivel1.jpg")
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

		objetos.add(new Alcantarilla(position = game.at(2, 2), grafico = "alcantarilla.png", salida = [6, 6]))
		objetos.add(new Alcantarilla(position = game.at(6, 6), grafico = "alcantarilla.png", salida = [2, 2]))
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

	override method iniciarAnimaciones() {
		objetos.add(new BarraVida(jugador = jugadores.last(), position = game.at(14, 0), grafico = "barra_red"))
	}

	// //////////////////////////////ROBAMOS PARA PROBAR(DE ESTO no e SCoOOOCApPAI)
	/* method mostrarPiso(){
	 * 	    20.times({n=>piso.add(new PisoDeTierra(position=game.at(n-1,0)))})
	 * 	    20.times({n=>piso.add(new  PisoDePasto(position=game.at(n-1,1)))})
	 * 	    30.times({n=>piso.add(new         Agua(position=game.at(n+19,0)))})
	 * 	    7.times({n=>piso.add(new  PisoDePasto(position=game.at(n+42,16)))})
	 * 	    8.times({n=>piso.add(new  PisoDePasto(position=game.at(n+17,7)))})
	 * 	    5.times({n=>piso.add(new  PisoDePasto(position=game.at(n+23,13)))})
	 * 	    14.times({n=>piso.add(new  PisoDePasto(position=game.at(n-1,14)))})
	 * 	    26.times({n=>piso.add(new  PisoDePasto(position=game.at(n+5,23)))})
	 * 	    18.times({n=>piso.add(new  PisoDePasto(position=game.at(n+23,28)))})
	 * 	    piso.forEach({unPiso=>game.addVisual(unPiso)})}
	 * 	    method mostrarEscaleras(){
	 * 	    4.times({n=>escaleras.add(new Escalera(position=game.at(18,1+n),indice=0))})
	 *      2.times({n=>escaleras.add(new Escalera(position=game.at(18,5+n),indice=1))})
	 *      4.times({n=>escaleras.add(new Escalera(position=game.at(24,7+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(24,11+n),indice=1))})
	 * 	    8.times({n=>escaleras.add(new Escalera(position=game.at(27,13+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(27,21+n),indice=1))})
	 * 	    3.times({n=>escaleras.add(new Escalera(position=game.at(24,23+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(24,26+n),indice=1))})
	 * 	    7.times({n=>escaleras.add(new Escalera(position=game.at(12,14+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(12,21+n),indice=1))})
	 escaleras.forEach({unaEscalera=>game.addVisual(unaEscalera)})}*/
	////////////////////////////////////////////////////FIN ESTO NO ES COCA	
}

object nivel2 inherits Niveles {
	
	override method iniciarPresentacion() {
		const presentacionNivel2 = new Ente(grafico = "nivel2.jpg")
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
		// La camioneta bloquea a los zombies y envia un mensaje de error.
		//objetos.add(new Camioneta(position = game.at(7, 9), grafico = "camioneta.png"))
	}
	
	override method iniciarAnimaciones() {
		// En construccion.
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