# Niveles
Para comenzar el juego Creamos un objeto inicio para la pantalla principal del juego

## Objeto inicio

*  **method iniciar():**
Se setea previamente que nivel va a iniciar luego de apretar ENTER
Se hace el game.start() para que inicie el nivel

* **method configurarPantalla():**
Se configura el tamaño de la pantalla, título y el fondo de pantalla
Creamos una clase nivel en la cual seteamos el movimiento del personaje principal (pueden ser 2 jugadores), Utilizamos métodos polimórficos para armar los distintos niveles.
También creamos los objetos perdiste y final para la pantalla final del juego que ganaste y para el game over.
Class Nivel
method agregarJugador(jugadorPosicion, jugadorGrafico)
Posiciona al objeto jugador en una coordenada de la pantalla con su respectivo gráfico

* **method asignarTeclas():**
Setea las teclas de los jugadores 1 y 2.

* **method iniciar():**
Permite iniciar el nivel el program

Métodos vacíos para mantener polimorfismo:

method iniciarPresentacion()    
method iniciarFondo()    
method iniciarBloques()      
method iniciarZombies()      
method iniciarJugadores()        
method iniciarOtrosElementos()      
method iniciarAnimaciones()       
method iniciarExtras()      

## Objeto nivel1
Hereda de Nivel

Primer Nivel
El objetivo del nivel es recolectar los elementos necesarios para poder reparar el auto y huir de los zombies y demonios. Hay que esquivar a los zombies y demonios para no perder vidas y retroceder. Se pueden tomar atajos mediante las alcantarillas. Una vez que se agarran todas las herramientas y se llega al auto, pasa al nivel 2. 

* **override method iniciarZombies():** 
Se encarga de instanciar todos los objetos de la clase Zombie con su correspondiente movimiento.

* **override method iniciarOtrosElementos():** 
Instancia los objetos que no tienen movimiento.

* **override method iniciarAnimaciones():**
Agregamos un objeto de clase BarraVida que a medida que el personaje recibe daño va disminuyendo.

## Objeto nivel2
Hereda de Nivel

Segundo Nivel
El objetivo principal es sobrevivir a la horda de zombies y demonios que se acercan a tu posición. Podés disparar con CTRL para matar a los enemigos. Para ganar el nivel hay que esperar a que llegue la nave de rescate y subirse a ella para escapar. Hay que esquivar a los zombies ya que te lastiman de la misma forma que en el Nivel 1. 


* **override method iniciarZombies():**
Utilizamos un onTick que cada 400 milisegundos instancia un objeto de la clase Zombie en una posición generada por el objeto randomZombies

* **override method asignarTeclas():**
Reasignamos las teclas al personaje principal. Ahora se mueve de izquierda a derecha y dispara con CNTRL. 

* **method crearBala():**
Instancia un objeto de clase Bala..
- La posición inicial es igual a la posición del personaje (x,y+1) .
-Se le asigna el movimiento mediante un tick el cual desplaza la posición de la misma utilizando el objeto arriba (ver sección direcciones). 
-Utiliza el objeto físicas para las colisiones (ver sección físicas)

* **method movimientoZombie(unZombie)**
-Desplaza los objetos Zombie utilizando el objeto abajo y su método mover(algo) siempre y cuando su coordenada en el eje y no sea cero. 
-Si es cero reasigna nuevamente una posición utilizando el objeto randomZombies 


## Objeto final
*  **method iniciar()**: Permite iniciar la pantalla final del juego

