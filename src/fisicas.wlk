import wollok.game.*
import entes.*
import jugador.*
import direcciones.*
import niveles.*

object fisicas {

	method colisiones(objeto) {
		game.onCollideDo(objeto, {otroObjeto =>
			if (objeto.prioridadColisiones() != otroObjeto.prioridadColisiones()) {
				if (objeto.prioridadColisiones() > otroObjeto.prioridadColisiones()) { 
					objeto.colisionar(otroObjeto)
				} else {
					otroObjeto.colisionar(objeto)
				}
			}})
	}

	method colisionesEntreTodos(objetos) {
		objetos.forEach({ unObjeto => self.colisiones(unObjeto) })
	}

}