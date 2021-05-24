import mecanicas.*
import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*

class Presentacion {

	method continuar() {
		game.stop() // aca deberia pasar a la proxima pantalla
		// por ahora finaliza el juego
	}
}

object inicio inherits Presentacion {

	method iniciar() {
		game.boardGround("Principal.jpg")
		teclado.presionarEnter(self)
	}

}

class Niveles {

	const jugadores = []
	const zombies = []

	// const cantidadDeBalas =[]-----------ver cantiad de de balas
	method jugadores() {
		return jugadores
	}

	method agregarJugador(jugadorPosicion, jugadorGrafico) {
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

	method agregarZombie(zombiePosicion) {
		zombies.add(new Zombie(position = zombiePosicion))
		game.addVisual(zombies.last())
	}

	method asignarModoEditorA(ente) {
		keyboard.space().onPressDo({ game.say(ente, "xy = (" + ente.position().x().toString() + ", " + ente.position().y().toString() + ")")})
	}

}

object nivel1 inherits Niveles {

	method iniciar() {
		game.boardGround("fondo_carretera.png")
			// Con esta linea, funciona bien el multijugador,
			// pero se bugea el mensaje.
			// self.agregarJugador(game.origin(), "george")
			// self.agregarZombie(game.at(3,8),'Slime')<------hayq ue buscar como añadir una clase por el tema de las trampas(que no se muevan)
			// self.agregarZombie(game.at(7,7),'Slime')
		self.agregarZombie(game.at(5, 9)) // camina recto eje y
		zombies.last().agregarPunto(5, 5)
		self.agregarZombie(game.at(7, 6)) // camina cuadrado
		zombies.last().agregarPunto(6, 7)
		self.agregarZombie(game.at(10, 8)) // camina recto eje y
		zombies.last().agregarPunto(10, 2)
		self.agregarZombie(game.at(13, 8)) // camina recto eje y
		zombies.last().agregarPunto(13, 3)
		self.agregarZombie(game.at(15, 10)) // camina cuadrado
		zombies.last().agregarPunto(11, 5)
		self.agregarZombie(game.at(10, 3)) // camina recto eje x
		zombies.last().agregarPunto(16, 3)
		self.agregarZombie(game.at(1, 6)) // camina cuadrado		
		zombies.last().agregarPunto(3, 11)
		self.agregarZombie(game.at(17, 11)) // camina recto eje y
		zombies.last().agregarPunto(17, 3)
		self.agregarZombie(game.at(6, 11)) // camina recto eje x
		zombies.last().agregarPunto(13, 11)
		zombies.forEach({ unZombie => unZombie.iniciarMovimiento("ciclico1", 100.randomUpTo(400))})
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
		self.agregarJugador(game.origin(), "george")
		self.asignarModoEditorA(jugadores.last())
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

	// player1 uno se mueve con flechas izquierda y derecha y dispara con control
	// player2 se mueve con A y D y dispara con G
	override method agregarJugador(jugadorPosicion, jugadorGrafico) {
		if (jugadores.size() > 2) {
			self.error("maxima cantidad de jugadores alcanzado.")
		}
		jugadores.add(new Jugador(position = jugadorPosicion, grafico = jugadorGrafico))
		game.addVisual(jugadores.last())
		if (jugadores.size() == 1) {
			teclado.asignarMovPlayer1Nivel2(jugadores.first()) // agrego nueva mecanica restringe movimiento
		} else {
			teclado.asignarMovPlayer2Nivel2(jugadores.last()) // agrego nueva mecanica restringe movimiento
		}
	// teclado.hablar(jugadores.last()) se podria sacar este porque hablan los dos al mismo tiempo
	}

	method crearBala() { // hay que lograr que acepte los dos jugadores
		const bala = new Bala(position = jugadores.first().position().up(1), grafico = "bullet.png")
		game.addVisual(bala)
		if (bala.position().y() == game.height() - 1) {
			game.removeVisual(bala)
		}
		bala.mover()
	}

	method movimientoZombie(unZombie) {
		game.onTick(1000, self.toString(), { if (unZombie.position().y() == 0) {
				unZombie.position(randomZombie.position()) // <---------------------new
			}
			unZombie.position(unZombie.position().down(1))
		})
	}

	method iniciarHorda() {
		game.onTick(400, "CREAR_ZOMBIE", { self.agregarZombie(randomZombie.position())
			self.movimientoZombie(zombies.last())
			fisicas.colisionesBala(zombies.last())
		})
	}

	method iniciar() {
		self.iniciarHorda()
			// aca inicio la creacion de los zombies
		const camioneta = new Camioneta(position = game.at(7, 9), grafico = "camioneta.png")
		const bloqueCamion = new Bloque(position = game.at(8, 9), grafico = "autoTracero.png")
		game.addVisual(bloqueCamion)
		game.addVisual(camioneta)
		game.boardGround("fondo_carretera.png")
		self.agregarJugador(game.origin(), "george")
		self.asignarModoEditorA(jugadores.last())
		fisicas.colisiones(jugadores)
	}

}

