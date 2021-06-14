# Entes

En esta sección colocamos todos los entes que interactúan en los distintos niveles. Modelamos al personaje principal, los enemigos y los objetos que no tienen un movimiento autonomo o son inanimados como los bloques que forman las paredes, la barra de vida, el auto, la nave y las balas.  Tambien creamos objetos que nos permiten randomizar la posicion de los enemigos y la nave.

##  Class Ente 
* **method prioridadColisiones():**       
-Creamos un sistema que le asignamos una prioridad a los entes del juego ya que todos entienden el método colisionar. Así controlamos  qué objeto es prioritario a la hora de elegir la colisión cuando se encuentran. 

* **method mayorPrioridadColisiones(alguien):**     
-Compara la prioridad de colisiones propias con  la prioridad de colisiones del ‘alguien’, si esta es menor que la propia ejecuta el método colisionar(alguien) de él mismo.

Por ejemplo en el nivel1 el personaje principal tiene menos prioridad de colisión que el zombie. De esta forma el método colisionar que se ejecuta es el del Zombie.En cambio en el nivel2 la bala tiene mayor prioridad que el zombie porque es la bala la que colisiona con el zombie para eliminarlo.

* **method estaVivo():**     
-Verifica que esté vivo, devuelve true o false dependiendo si las vidas son mayores a 0.

* **method colisionar(alguien):**    
-Es un método abstracto, ya que depende del objeto que se cree.

## Class EnteBot
EnteBot hereda de Ente

* **method agregarPunto(coordenadaX, coordenadaY):**       
-Agrega el punto pasado por parámetro  a la colección de puntos del objeto.

* **method iniciarMovimiento(tipoDeMovimiento, tiempo):**       
-Inicia el movimiento del objeto y cada cuanto tiempo hace el movimiento dependiendo de los puntos que tenga asignados. Para poder hacer que el objeto se mueva se llama al metodo movimiento.

* **method puntoX(numeroDePunto):**    
-Devuelve de la lista de puntos, en la posición que se pasa por parámetro el primer valor del conjunto, en este caso la posición X.

* **method puntoY(numeroDePunto):**     
-Devuelve de la lista de puntos, en la posición que se pasa por parámetro el último valor del conjunto, en este caso la posición Y.

* **method movimiento(tipoDeMovimiento):**      
-Verifica que no gireEnEjeX y no gireEnEjeY para poder ejecutar el método punto Alcanzado,dependiendo del tipo de movimiento.

* **method girarEnEjeX():**        
-Verifica que la posición en X sea menor a la posición del punto actual en X, si es así, permite girar al objeto a la derecha y devuelve true.   
-Si no se cumple lo anterior pero si la posición en X es mayor a la posición del punto actual en X,  se hace girar a la izquierda y devuelve true.    
-Si ninguna de las condiciones se cumple devuelve false.

* **method girarEnEjeY():**       
-Muy parecido al anterior solo que si el punto en Y es menor a la posición del punto actual en Y, gira para abajo. Pero si la posición en Y es mayor a la del punto actual en Y, gira hacia arriba.

* **method puntoAlcanzado(tipoDeMovimiento):**       
-Verifica que el tamaño de la lista de puntos sea igual al puntoActual, si así lo es verifica que el movimiento sea ‘cíclico’ para poder volver al inicio de la lista de puntos y poder volver a recorrer la lista y que se vaya moviendo en esas direcciones. Si no es ese tipo de movimiento, remueve el evento OnTick.      
-Si la lista de puntos no es del mismo tamaño del puntoActual, le suma uno al puntoActual para poder seguir moviéndose.

## Class EnteMalvado
EnteMalvado hereda de EnteBot

* **method colisionar(alguien):**       
-Cuando colisiona con alguien, le baja la vida. Luego evalúa el estado del ‘alguien’, para saber si está vivo, si no es así, ejecuta el objeto perdiste.iniciar(), el cual lleva a la pantalla GAME OVER.

## Class Bloque
Bloque hereda de la clase Ente

* **method colisionar(alguien):**       
-Cuando Bloque es encontrado, hace que el ‘alguien’ realice el movimiento contrario, es decir si el último movimiento fue abajo, realizará el movimiento arriba. El objetivo es que el personaje no pueda sobrepasar al bloque, que funcione como una pared.

## Class Camioneta
-Hereda de Bloque

* **method colisionar(alguien):**                  
-Cuando se encuentra, verifica que ‘alguien’ tenga todas las herramientas necesarias para poder pasar de nivel, si no las tiene no pasa nada. Si tiene 4 herramientas (el total de ellas), permite pasar al siguiente nivel mediante el método movimiento().

* **method movimiento():**          
-Este método se llama una vez que se haya verificado que el alguien tenga todas las herramientas, permite que la camioneta se mueva cada un determinado tiempo y salga del visual, para poder pasar al nivel 2.

## Class Avión
Avión hereda de Camioneta

* **method colisionar(alguien):**       
-Verifica que ‘alguien’ sea el personaje, elimina al personaje de la visual y ejecuta el metodo movimiento(), si no es el personaje, no hace nada.

* **method movimiento()**        
-Realiza el movimiento del avión para salir del visual cada un determinado tiempo, luego llama al objeto final para poder mostrar la pantalla ganadora.

## Class barraVida
-Hereda de Ente.
-Se configura las imágenes, la prioridad de colisiones y el jugador.

## Class Bala
-Hereda de EnteBot.
-Hay una colección que contiene los nombres de las diferentes imágenes que puede tener la bala.

* **method image():**       
-De la colección de imágenes, este método elige una aleatoria y se la asigna al objeto.

* **method colisionar(alguien):**      
-Le baja la vida al ‘alguien’ y también se baja su vida para poder salir del visual.

* **method bajarVida():**     
-Verifica que esté vivo, si es así, se baja la vida.
-Si no está vivo, se mueve a una posición donde no se ve en el visual.

## Class Zombie       
-Zombie hereda de EnteMalvado.
-Contiene una colección con los nombres de las diferentes imágenes que puede tener un zombie o demonio.

* **override method image():**     
-Elige un nombre de imagen aleatorio de la colección para el zombie que estemos creando. Y retorna la imagen dependiendo del nombre y de la dirección que se encuentre (arriba, abajo,derecha o izquierda).

* **override method bajarVida():**    
-Verifica que esté vivo, si es así, se baja la vida.
-Si no está vivo, le cambia la posición por una random que devuelve el objeto randomZombie.

## Class Alcantarilla
Alcantarilla hereda de Ente

* **override method colisionar(alguien):**      
-Hace girar al ‘alguien’ y luego lo mueve a la salida de la alcantarilla, siendo otra alcantarilla con diferente posición.


## Objeto randomZombie
* **method position():**    
 -Retorna un valor aleatorio en  coordenada  x mientras que en la coordenada y es siempre game.height-1

## Objeto randomNave
* **method position():**  
 -Retorna un valor aleatorio en  coordenada  x mientras que en la coordenada y es siempre 0.
