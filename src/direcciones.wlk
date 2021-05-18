import wollok.game.*
import objetos.*
import mecanicas.*
import jugador.*

object arriba{
	
	method moverArriba(distanciaY, alguien) 
	{
		if ((alguien.position().y() < (game.height()-1)) and (not alguien.muerto())) {
			alguien.position(alguien.position().up(distanciaY))
		} 
	}
	method girarArriba(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}	
	}

}
object abajo{
	method moverAbajo(distanciaY,alguien)
	{
		if ((alguien.position().y() > 0) and (not alguien.muerto())) {
			alguien.position(alguien.position().down(distanciaY)) 
		} 
	}
	method girarAbajo(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}
	}
}
object derecha{
	method moverDerecha(distanciaX,alguien)
	{
		if ( (( alguien.position().x() < (game.width()-1) ) and (not alguien.muerto()) )) {
			 alguien.position(alguien.position().right(distanciaX))
		} 
	}
	method girarDerecha(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}	
	}
}
object izquierda{
	
	method moverIzquierda(distanciaX,alguien)
	{
		if ((alguien.position().x() > 0) and ( not alguien.muerto())) {
			 alguien.position(alguien.position().left(distanciaX))
		} 
	}
	
	method girarIzquierda(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}
	}
}