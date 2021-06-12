import wollok.game.*
import entes.*
import jugador.*
import direcciones.*
import niveles.*

object fisicas {

	method colisiones(objeto) {
		game.onCollideDo(objeto, {algo => algo.mayorPrioridadColisiones(objeto)})
	}

	method colisionesEntreTodos(objetos) {
		objetos.forEach({ unObjeto => self.colisiones(unObjeto) })
	}

}