# Direcciones

En este apartado creamos la clase direccion la cual se encarga de generar el tipo de movimiento que tienen los Entes.

## Class Direccion
Permite definir la cantidad de ‘espacios’ que se va a mover el objeto. (var property distanciaPorPaso = 1)

* **method girar(objeto):**         
-Permite al objeto girar dependiendo en la dirección (objeto)  que se ejecute. Si la dirección es arriba y el objeto por parámetro está vivo, la dirección del objeto por parámetro será ‘arriba’.          
-Para eso modelamos los objetos arriba,abajo, derecha e izquierda.              
-Todos estos objetos heredan de Dirección.

* **method mover(objeto):**                     
-Verifica que el objeto esté vivo y mueve al objeto dependiendo que objeto de dirección sea (arriba,abajo,izquierda o derecha) en la distancia que está definida. 

* **method moverLimitado(objeto):**        
-Verifica que el objeto esté dentro del tamaño del visual para permitir que se mueva (ejecuta método mover).

* **method direccionOpuesta():**          
-Devuelve la dirección opuesta, arriba → abajo, derecha -> izquierda, etc...

* **method posicionMasUno(objeto):**   
-Retorna la posicion +1 de un ente. Se le suma 1 dependiendo en que direccion este posicionado.

Creamos los objetos arriba,abajo,izquierda,derecha que nos permite administrar los movimientos de los Entes
