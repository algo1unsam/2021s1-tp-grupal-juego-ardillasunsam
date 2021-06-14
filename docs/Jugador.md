# Jugador

En este apartado se encuentran los métodos propios del personaje principal. Muchos de sus metodos son heredados de la clase Ente. En esta clase configuramos la colisión con los enemigos, los mensajes random que emite y tambien el daño producido por los enemigos.

## Class jugador
El jugador hereda de la clase Ente

* **method image():**      
-La imagen del jugador depende del tipo de movimiento que esté haciendo. Crea el nombre de la imagen mediante el gráfico, en este caso es george concatenando también el movimiento, ya sea arriba,abajo,derecha o izquierda.

* **method bajarVida():**
-Verifica que el jugador esté vivo, si es así le baja una vida. Si luego de bajar una vida sigue vivo, lo mueve a la posición 0,0. Para que pueda seguir jugando desde el inicio.

* **method gritar():**         
-Dependiendo de la cantidad de vidas que tenga el jugador es el mensaje que emite.

* **method mensajeRandom():**          
-Cuando se presiona la tecla X, el personaje emite un mensaje random. Para elegir el mensaje se crea un numero random del 1 al 3, dependiendo del número se emite un determinado mensaje.

* **method colisionar(objeto):**         
-Cuando el jugador encuentra un objeto siendo este una herramienta, agrega a la misma a una colección y la remueve de la vista.
