import wollok.game.*
import enemigos.*
import movimiento.*

object personaje {

	var property position = game.origin()
	var property image = "george_down.png"
	var ultimaPosicion = position
	var ultimoMovimiento = up
    var property muerto = 0
    
	method cambiarGeorge(direccion){
		if(muerto==0){
		self.position(direccion.mov(self))
		image = "george_" + direccion.movString() + ".png"
		ultimaPosicion = direccion.mov(self)
		ultimoMovimiento = direccion}
	}
}

object up {

	method mov(cosa) {
		if (cosa.position().y() < game.height() - 1) {
			return cosa.position().up(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().up(1)
	}

	method movString() {
		return "up"
	}
}

object down {

	method mov(cosa) {
		if (cosa.position().y() > 0) {
			return cosa.position().down(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().down(1)
	}

	method movString() {
		return "down"
	}

}

object left {

	method mov(cosa) {
		if (cosa.position().x() > 0) {
			return cosa.position().left(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().left(1)
	}

	method movString() {
		return "left"
	}

}

object right {

	method mov(cosa) {
		if (cosa.position().x() < game.width() - 1) {
			return cosa.position().right(1)
		} else {
			return cosa.position()
		}
	}

	method mover(cosa) {
		return cosa.position().right(1)
	}

	method movString() {
		return "right"
	}

}

