import wollok.game.*
import objetos.*
import jugador.*


class Direccion 
{
	var property distanciaPorPaso = 1	
	method girar(objeto)
	{
		if (not objeto.muerto()) {
			objeto.direccion(self)
		}	
	}
}


object arriba inherits Direccion 
{
	method mover(objeto) 
	{
		if ((objeto.position().y() < (game.height()-1)) and (not objeto.muerto())) {
			objeto.position(objeto.position().up(self.distanciaPorPaso()))
		} 
	}

	method direccionOpuesta() = abajo
}


object abajo inherits Direccion 
{
	method mover(objeto)
	{
		if ((objeto.position().y() > 0) and (not objeto.muerto())) {
			objeto.position(objeto.position().down(self.distanciaPorPaso()))
		} 
	}
	
	method direccionOpuesta() = arriba
}


object derecha inherits Direccion 
{
	method mover(objeto)
	{
		if ((objeto.position().x() < (game.width()-1)) and (not objeto.muerto())) {
			 objeto.position(objeto.position().right(self.distanciaPorPaso()))
		} 
	}
	
	method direccionOpuesta() = izquierda
}


object izquierda inherits Direccion 
{
	method mover(objeto)
	{
		if ((objeto.position().x() > 0) and ( not objeto.muerto())) {
			 objeto.position(objeto.position().left(self.distanciaPorPaso()))
		} 
	}

	method direccionOpuesta() = derecha
}