# Colisiones

Dada la estructura del juego, donde cada elemento (jugador, valla, zombie, etc) es un objeto que se almacena en una coleccion en comun con todos los demas objetos, se puede hacer que todos estos "colisionen" mutuamente cuando sus posiciones son equivalentes, esto se puede lograr sencillamente como se muestra en el ejemplo a continuacion:

``` wollok
object zombie1 {
  method colisionar(otroElementoDelJuego) {
    /* codigo a ejecutar cuando el zombie1 colisiona con otro elemento */
  }
}
```

``` wollok
/* almacenamos todos los elementos del nivel en objetos. */
var objetos = [zombie1, zombie2, zombie3, jugador]

/* Llamamos al metodo para lograr que colisionen mutuamente entre todos. */
fisicas.colisionesEntreTodos(objetos)
```


``` wollok
object fisicas {
	method colisiones(objeto) {
		game.onCollideDo(objeto, {algo => algo.colisionar(objeto)})
	}

	method colisionesEntreTodos(objetos) {
		objetos.forEach({ unObjeto => self.colisiones(unObjeto) })
	}
}
```
Cuando un elemento1 colisiona con otro elemento2, se ejecutan el metodos `elemento1.colisionar(elemento2)` y `elemento2.colisionar(elemento1)`, ¡¡Hemos logrado que se colisionen los elementos!!... pero peroo perooooo como te habras percatado esto tiene un problema, si no lo has visto te lo explico facil; supongamos que nuestro juego tiene zombies y muros, el metodo `zombie.colisionar()` hace que este mate al otro elemento y el metodo `muro.colisionar()` hace que el zombie no pueda seguir avanzando. Una solucion a este problema seria implementar una logica semejante al de un semaforo, el cual solo deje ejecutar el metodo `colisionar()` de un solo elemento de los dos que colisionaron (el de los muros, ya que frena al zombie).

``` wollok
```
