import wollok.game.*
import objetos.*
import mecanicas.*
import jugador.*

object arriba{
	
	method mover(distanciaY, alguien) 
	{
		if ((alguien.position().y() < (game.height()-1)) and (not alguien.muerto())) {
			alguien.position(alguien.position().up(distanciaY))
		} 
	}
	method girar(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}	
	}
	method contrario(distancia,alguien){
		abajo.mover(distancia, alguien)

	}

}
object abajo{
	method mover(distanciaY,alguien)
	{
		if ((alguien.position().y() > 0) and (not alguien.muerto())) {
			alguien.position(alguien.position().down(distanciaY)) 
		} 
	}
	method girar(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}
	}
	method contrario(distancia,alguien){
		arriba.mover(distancia, alguien)

	}

}
object derecha{
	method mover(distanciaX,alguien)
	{
		if ( (( alguien.position().x() < (game.width()-1) ) and (not alguien.muerto()) )) {
			 alguien.position(alguien.position().right(distanciaX))
		} 
	}
	method girar(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}	
	}
	method contrario(distancia,alguien){
		izquierda.mover(distancia, alguien)

	}
}
object izquierda{
	
	method mover(distanciaX,alguien)
	{
		if ((alguien.position().x() > 0) and ( not alguien.muerto())) {
			 alguien.position(alguien.position().left(distanciaX))
		} 
	}
	
	method girar(alguien)
	{
		if (not alguien.muerto()) {
			alguien.direccion(self)
		}
	}
	method contrario(distancia,alguien){
		derecha.mover(distancia, alguien)

	}
}