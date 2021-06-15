# Fisicas

En este apartado modelamos el objeto fisicas el cual se encarga de administrar las colisiones entre los Entes.

## Objeto fisicas

* **method colisiones(objeto):**          
-Cuando colisionan 2 entes verifica que la prioridad de colisiones de los objetos no sea la misma.               
-Compara la prioridad de ambos para saber cual de los 2 tiene que colisionar con el otro.

* **method colisionesEntreTodos(objetos):**                         
-Entes es una colección con todos los entes que existen en el nivel.            
-Este método recorre esa lista haciendo ejecutar el método anterior (colisiones) para cada objeto de la lista, permitiendo así, las colisiones entre todos los objetos.
