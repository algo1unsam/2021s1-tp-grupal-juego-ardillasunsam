import wollok.game.*
import objetos.*
import jugador.*


class Direccion 
{
	method girar(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}	
	}
}


object arriba inherits Direccion 
{
	method mover(distanciaY, alguien) 
	{
		if ((alguien.position().y() < (game.height()-1)) and (not alguien.muerto())) {
			alguien.position(alguien.position().up(distanciaY))
		} 
	}

	method direccionOpuesta() 
	{
		return abajo
	}
}


object abajo inherits Direccion 
{
	method mover(distanciaY,alguien)
	{
		if ((alguien.position().y() > 0) and (not alguien.muerto())) {
			alguien.position(alguien.position().down(distanciaY)) 
		} 
	}
	
	method direccionOpuesta() 
	{
		return arriba
	}
}


object derecha inherits Direccion 
{
	method mover(distanciaX,alguien)
	{
		if ( (( alguien.position().x() < (game.width()-1) ) and (not alguien.muerto()) )) {
			 alguien.position(alguien.position().right(distanciaX))
		} 
	}
	
	method direccionOpuesta() 
	{
		return izquierda
	}
}


object izquierda inherits Direccion 
{
	method mover(distanciaX,alguien)
	{
		if ((alguien.position().x() > 0) and ( not alguien.muerto())) {
			 alguien.position(alguien.position().left(distanciaX))
		} 
	}

	method direccionOpuesta() 
	{
		return derecha
	}
}