# Teclado

Aquí modelamos el objeto teclado el cual contiene todos los métodos que permiten generar acciones cuando se presionan distintos tipos de teclas.

## Objeto teclado

* **method moverYFlechaArribaAbajo(jugador):**        
-Configura las teclas arriba y abajo, cuando son presionadas el jugador se mueve dependiendo de la flecha.

* **method moverXFlechaDerechaIzquierda(jugador):**            
-Igual que moverYFlechaArribaAbajo(jugador), solo que con las flechas izquierda y derecha.

* **method moverYTeclaWS(jugador) y method moverXTeclaAD(jugador):**        
Son iguales a los métodos anteriores, solo que con las teclas W-S-A-D, en el caso que se quiera agregar otro jugador más. 

* **method dispararTeclaCTRL(jugador):**         
-Se utiliza en el nivel2, configura la tecla CTRL, cuando es presionada, gira al jugador hacia arriba y crea una bala para que pueda ser disparada.

* **method dispararTeclaG(jugador):**        
-Igual al anterior, se usaría en el caso de que hubiese un jugador número 2.

* **method mostrarCoordenadaTeclaH(objeto):**          
-Al presionar la tecla H, el objeto muestra en qué coordenada se encuentra.

* **method hablarTeclaX(objeto):**            
-Cuando se presiona la tecla X, el objeto emite un mensaje random.

* **method presentacionTeclaEnter(nivel):**          
-Configura la tecla Enter, cuando estemos en la presentación del juego y queramos empezar a jugar, presionamos enter y empieza el nivel.

