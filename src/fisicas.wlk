import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*
import niveles.*

object fisicas {

	method colisiones(objeto) {
		game.onCollideDo(objeto, {algo => algo.mayorPrioridadColiciones(objeto)})
	}

	method colisionesEntreTodos(objetos) {
		objetos.forEach({ unObjeto => self.colisiones(unObjeto) })
	}

}