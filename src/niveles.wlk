import mecanicas.*
import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*


object inicio {

	method iniciar() {
		self.configurarPantalla()
		teclado.presentacionTeclaEnter(nivel2)
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
	const zombies = []

	method jugadores() = jugadores

	method agregarJugador(jugadorPosicion, jugadorGrafico) {
		if (jugadores.size() > 2) {
			self.error("maxima cantidad de 
                        jugadores alcanzado.")
		}

		jugadores.add(new Jugador(position = jugadorPosicion, grafico = jugadorGrafico, vidas = 3))
		game.addVisual(jugadores.last())

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
	
	method agregarZombie(zombiePosicion) {
		zombies.add(new Zombie(position = zombiePosicion))
		game.addVisual(zombies.last())
	}

	method modoEditorTeclaH(objeto) {
		keyboard.h().onPressDo({ game.say(objeto, "xy = (" + objeto.position().x().toString() + "," + objeto.position().y().toString() + ")")})
	}

}

object nivel1 inherits Niveles {

	method presentacion(){
		game.clear()
		const introNiv1 = new Ente(grafico = "nivel1.jpg")
		game.addVisual(introNiv1)
		game.schedule(5000, { self.iniciar()})
	}

	method iniciar() {
		game.clear()
		const nivel1 = new Ente(grafico = "fondo_nivel1.jpg")
		game.addVisual(nivel1)
			// Con esta linea, funciona bien el multijugador,
			// pero se bugea el mensaje.
			// self.agregarJugador(game.origin(), "george")
			// self.agregarZombie(game.at(3,8),'Slime')
			// arriba<------hayq ue buscar como añadir una clase
			// por el tema de las trampas(que no se muevan)
			// self.agregarZombie(game.at(7,7),'Slime')
		/* 	
		self.agregarZombie(game.at(5, 9)) // recto eje y
		zombies.last().agregarPunto(5, 5)
		self.agregarZombie(game.at(7, 6)) // cuadrado
		zombies.last().agregarPunto(6, 7)
		self.agregarZombie(game.at(10, 8)) // recto eje y
		zombies.last().agregarPunto(10, 2)
		self.agregarZombie(game.at(13, 8)) // recto eje y
		zombies.last().agregarPunto(13, 3)
		self.agregarZombie(game.at(15, 10)) // cuadrado
		zombies.last().agregarPunto(11, 5)
		self.agregarZombie(game.at(10, 3)) // recto eje x
		zombies.last().agregarPunto(16, 3)
		self.agregarZombie(game.at(1, 6)) // cuadrado		
		zombies.last().agregarPunto(3, 11)
		self.agregarZombie(game.at(17, 11)) // recto eje y
		zombies.last().agregarPunto(17, 3)
		self.agregarZombie(game.at(6, 11)) // recto eje x
		zombies.last().agregarPunto(13, 11)
		
		zombies.forEach({ unZombie => unZombie.iniciarMovimiento("ciclico", 100.randomUpTo(400))})
		*/
		const camioneta = new Camioneta(position = game.at(7, 9), grafico = "camioneta.png")
		const bloque = new Bloque(position = game.at(0, 4), grafico = "valla.png")
		const bloque1 = new Bloque(position = game.at(1, 4), grafico = "valla.png")
		const bloque2 = new Bloque(position = game.at(2, 4), grafico = "valla.png")
		const bloque3 = new Bloque(position = game.at(3, 4), grafico = "valla.png")
		const bloque4 = new Bloque(position = game.at(4, 4), grafico = "valla.png")
		const bloque5 = new Bloque(position = game.at(7, 4), grafico = "valla.png")
		const bloque6 = new Bloque(position = game.at(8, 4), grafico = "valla.png")
		const bloque7 = new Bloque(position = game.at(9, 4), grafico = "valla.png")
		const bloque8 = new Bloque(position = game.at(9, 2), grafico = "muro.png")
		const bloque9 = new Bloque(position = game.at(9, 1), grafico = "muro.png")
		const bloque10 = new Bloque(position = game.at(9, 0), grafico = "muro.png")
		const bloqueCamion = new Bloque(position = game.at(8, 9), grafico = "autoTracero.png")
		const rueda = new Herramienta(position = game.at(15, 1), grafico = 'rueda.png')
		const herramienta = new Herramienta(position = game.at(18, 6), grafico = 'Herramienta.png')
		const bidon = new Herramienta(position = game.at(15, 11), grafico = 'bidon.png')
		const tuerca = new Herramienta(position = game.at(3, 11), grafico = 'tuerca.png')
		const alcantarilla1 = new Alcantarilla(position = game.at(2, 2), grafico = 'alcantarilla.png', salida = [6, 6])
		const alcantarilla2 = new Alcantarilla(position = game.at(6, 6), grafico = 'alcantarilla.png', salida = [2, 2])
		game.addVisual(bloqueCamion)
		game.addVisual(camioneta)
		game.addVisual(bloque)
		game.addVisual(bloque1)
		game.addVisual(bloque2)
		game.addVisual(bloque3)
		game.addVisual(bloque4)
		game.addVisual(bloque5)
		game.addVisual(bloque6)
		game.addVisual(bloque7)
		game.addVisual(bloque8)
		game.addVisual(bloque9)
		game.addVisual(bloque10)
		game.addVisual(rueda)
		game.addVisual(herramienta)
		game.addVisual(bidon)
		game.addVisual(tuerca)
		game.addVisual(alcantarilla1)
		game.addVisual(alcantarilla2)
		self.agregarJugador(game.origin(), "george")
		self.modoEditorTeclaH(jugadores.last())
		const barraVida = new BarraVida(jugador = jugadores.last(), position = game.at(14, 0), grafico = "barra_red")
		game.addVisual(barraVida)
		fisicas.colisiones(jugadores)
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
	 *      	2.times({n=>escaleras.add(new Escalera(position=game.at(18,5+n),indice=1))})
	 *      	4.times({n=>escaleras.add(new Escalera(position=game.at(24,7+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(24,11+n),indice=1))})
	 * 	    8.times({n=>escaleras.add(new Escalera(position=game.at(27,13+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(27,21+n),indice=1))})
	 * 	    3.times({n=>escaleras.add(new Escalera(position=game.at(24,23+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(24,26+n),indice=1))})
	 * 	    7.times({n=>escaleras.add(new Escalera(position=game.at(12,14+n)))})
	 * 	    2.times({n=>escaleras.add(new Escalera(position=game.at(12,21+n),indice=1))})
	 escaleras.forEach({unaEscalera=>game.addVisual(unaEscalera)})}*/
	// //////////////////////////////////////////////////FIN ESTO NO ES COCA	
	}

}

object nivel2 inherits Niveles {
	
	method presentacion(){
		game.clear()
		const introNiv2 = new Ente(grafico = "nivel2.jpg")
		game.addVisual(introNiv2)
		game.schedule(5000, { self.iniciar()})
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
	}

	method movimientoZombie(unZombie) {
		game.onTick(1000, self.identity().toString(), {
			if (unZombie.position().y() == 0) {
				unZombie.position(randomZombie.position())
			}
			abajo.mover(unZombie)
		})
	}

	method iniciarHorda() {
		game.onTick(400, "CREAR_ZOMBIE", { self.agregarZombie(randomZombie.position())
			self.movimientoZombie(zombies.last())
			fisicas.colisionesBala(zombies.last())
		})
	}

	method iniciar() {
		game.clear()
		const nivel2 = new Ente(grafico = "fondo_nivel2.jpg")
		game.addVisual(nivel2)
		self.iniciarHorda()
			// aca inicio la creacion de los zombies
		const camioneta = new Camioneta(position = game.at(7, 9), grafico = "camioneta.png")
		const bloqueCamion = new Bloque(position = game.at(8, 9), grafico = "autoTracero.png")
		game.addVisual(bloqueCamion)
		game.addVisual(camioneta)
		game.boardGround("fondo_carretera.png")
		self.agregarJugador(game.origin(), "george")
		self.modoEditorTeclaH(jugadores.last())
		fisicas.colisiones(jugadores)
	}

}

