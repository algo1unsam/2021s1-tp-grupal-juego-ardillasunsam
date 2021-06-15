# Direcciones

En este apartado creamos la clase direccion la cual se encarga de generar el tipo de movimiento que tienen los Entes.

## Class Direccion
Permite definir la cantidad de ‘espacios’ que se va a mover el objeto. (var property distanciaPorPaso = 1)

* **method girar(objeto):**         
-Permite al objeto girar dependiendo en la dirección (objeto)  que se ejecute. Si la dirección es arriba y el objeto por parámetro está vivo, la dirección del objeto por parámetro será ‘arriba’.      
Objeto arriba, Objeto abajo, Objeto derecha y Objeto izquierda.            
-Todos estos objetos heredan de Dirección.

* **method mover(objeto):**                     
-Verifica que el objeto esté vivo y mueve al objeto dependiendo que objeto de dirección sea (arriba,abajo,izquierda o derecha) en la distancia que está definida. 

* **method moverLimitado(objeto):**        
-Verifica que el objeto esté dentro del tamaño del visual para permitir que se mueva (ejecuta método mover).

* **method direccionOpuesta():**          
-Devuelve la dirección opuesta, arriba → abajo, derecha -> izquierda, etc...
