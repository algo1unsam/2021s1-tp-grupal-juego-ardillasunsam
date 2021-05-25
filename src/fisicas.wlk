import wollok.game.*
import objetos.*
import jugador.*
import direcciones.*
import niveles.*

object fisicas {

	method colisiones(objetos) {
		objetos.forEach({ unObjeto => game.onCollideDo(unObjeto, {algo => algo.mayorPrioridadColiciones(unObjeto)}) })
	}

}