import wollok.game.*
import entes.*
import jugador.*


class Direccion 
{
	var property distanciaPorPaso = 1	
	
	method girar(objeto)
	{
		if (objeto.estaVivo()) {
			objeto.direccion(self)
		}	
	}
}


object arriba inherits Direccion 
{
	method mover(objeto)
	{
		if (objeto.estaVivo()) {
			objeto.position(objeto.position().up(self.distanciaPorPaso()))
		}
	}
	
	method moverLimitado(objeto) 
	{
		if (objeto.position().y() < (game.height()-1)) {
			self.mover(objeto)
		}
	}

	method direccionOpuesta() = abajo
}


object abajo inherits Direccion 
{
	method mover(objeto)
	{
		if (objeto.estaVivo()) {
			objeto.position(objeto.position().down(self.distanciaPorPaso()))
		}
	}
	
	method moverLimitado(objeto)
	{
		if (objeto.position().y() > 0) {
			self.mover(objeto)
		}
	}
	
	method direccionOpuesta() = arriba
}


object derecha inherits Direccion 
{
	method mover(objeto)
	{
		if (objeto.estaVivo()) {
			 objeto.position(objeto.position().right(self.distanciaPorPaso()))
		}
	}
	
	method moverLimitado(objeto)
	{
		if (objeto.position().x() < (game.width()-1)) {
			 self.mover(objeto)
		} 
	}
	
	method direccionOpuesta() = izquierda
}


object izquierda inherits Direccion 
{
	method mover(objeto)
	{
		if (objeto.estaVivo()) {
			 objeto.position(objeto.position().left(self.distanciaPorPaso()))
		}
	}
	
	method moverLimitado(objeto)
	{
		if (objeto.position().x() > 0) {
			 self.mover(objeto)
		}
	}

	method direccionOpuesta() = derecha
}