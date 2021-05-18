import wollok.game.*
import objetos.*
import mecanicas.*


class Jugador inherits Objeto
{
	override method image() {
		if (not muerto) {
			return (self.grafico() + "_" + self.direccion() + ".png")
		} else {
			return ("sangre.png")
		}
	}
}