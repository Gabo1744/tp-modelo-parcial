# tp-modelo-parcial

[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/IBLp7G-T)
# Parcial 2023C1

Se nos pide desarrollar parte del modelo de un juego inspirado en la saga del Señor de los Anillos. Las definiciones incluyen varias etapas en el desarrollo.

## Algunos seres 

En esta etapa tenemos que modelar varios de los ``seres hablantes'' que habitan la tierra media en la tercera edad. 
De cada uno nos interesa saber su **habilidad** (que es un número), y si es inmortal o no. Por otra parte, la dinámica del juego incluye circunstancias en las que un ser **adquiere experiencia**; para cada ser se define qué debe hacer en tal caso.

En particular, nos piden modelar tres especies: elfos, hobbits y enanos.

#### Elfos
Estos seres son inmortales, y cada uno se conoce la cantidad de canciones que sabe, que inicialmente es 20 (los elfos son así, nacen sabiendo) pero puede variar en cualquier momento, la variación solo puede ser incrementando la cantidad de canciones o reduciendo esa cantidad en un número que siempre debe ser positivo.  
La **habilidad** se calcula en base a la cantidad de canciones que sabe: si son 60  o menos entonces es 180; en caso contrario, es el triple de esa cantidad.
Al **adquirir experiencia**, duplica la cantidad de canciones que sabe.    
O sea, un elfo que sabe 50 canciones tiene 180 de habilidad. Si adquiere experiencia, pasa a saber 100 canciones, y por lo tanto, su habilidad se calcula como 300.

#### Hobbits
Para los hobbits, la habilidad se define en base a las cantidades de amigos y de historias que escuchó. Cuando se crea, un hobbit arranca con 40 amigos, y con 6 historias escuchadas.  
Su **habilidad** se calcula así: si tiene menos de 60 amigos, entonces coincide con la cantidad de historias que escuchó * 100; en caso contrario, es cantidad de historias * 50.
Cuando **adquiere experiencia**, la cantidad de amigos aumenta en 8.  
Para los hobbits se define una acción adicional que es _organizar una fiesta_: el efecto es que tanto la cantidad de amigos como la de historias que escuchó aumentan en 5.
Podemos decir que los hobbits nacen inmortales, pero cuando tiene pocos amigos (un número menor a 20) se deprimen y pierden la inmortalidad.

#### Enanos
Para los enanos, la habilidad se calcula a partir de su ira. Cuando se crea un enano, su ira es de 200 unidades.  
La **habilidad** de un enano es el doble de su ira.
Cuando **adquiere experiencia**, su ira aumenta en 300 unidades.
Los enanos son siempre mortales.

## Seres especiales

También debemos contemplar dos tipos especiales de seres: los elfos silvanos y las enanos herreros.

La habilidad de un **elfo silvano** es de 400 unidades más de lo que correspondería según el cálculo de un elfo común de sus mismas características.

Para un **enano herrero**, la habilidad es 100 unidades por cada espada que fabricó. Un enano herrero nace con 3 espadas fabricadas. Cuando adquiere experiencia, además de la acción común a todos los enanos, fabrica una espada.


## Territorios

La tierra media incluye varios **territorios**. En cada territorio hay seres de las distintas especies descriptas en la parte anterior.

Se pide modelar los territorios, de forma de poder realizar lo que sigue:

- obtener los _seres torpes_ de un territorio, son aquellos cuya habilidad sea menor a 1000.
- obtener el valor máximo de habilidad entre todos los seres inmortales.
- obtener el _promedio De habilidad Total_ de un territorio.
- poder averiguar si un territorio _es sabio_: la condición es que todos los seres que lo habitan tengan una habilidad mayor a 300.
- indicar que hubo un _torneo_: todos los seres deben adquirir experiencia.
- indicar que hubo una _epifanía_ : todos los _seres torpes_ deben adquirir experiencia.
- determinar si hay algún ser mortal en el territorio.

## Test de territorio y seres

Armar un test con el siguiente escenario inicial
- crear un elfo silvano, un hobbit y un enano herrero. Después, hacer que el hobbit organice una fiesta.
- crear un territorio, y agregar a los tres seres en el mismo.

Verificar que
- la habilidad del elfo debe ser 580, la del hobbit 1100, y la del enano 300 respectivamente.
- el hobbit debe tener 45 amigos y debe ser inmortal.
- el promedio de habilidad del territorio es 660.
- el valor máximo de habilidad entre todos los seres inmortales debe ser 1100. 
- los seres torpes del territorio son el elfo y el enano.
- existe un ser mortal en el territorio.

A partir de la situación inicial, indicar que en el territorio hubo un torneo. Después de esto:
* el elfo debe saber 40 canciones,
* el hobbit ahora debe tener 53 amigos,
* y la ira del enano debe subir a 500.

La habilidad del elfo sigue siendo 580, la del hobbit sigue siendo 1100, la del enano pasa a 400. Por lo tanto, siguen siendo torpes el elfo y el enano.

Finalmente, indicar que en el territorio hubo una epifanía después del torneo. El elfo ahora debe saber 80 canciones, y su habilidad debe pasar a 640. La cantidad de amigos del hobbit debe ser igual que antesy la ira del enano pasa a ser 800.  
Este último test se puede hacer también partiendo de la situación inicial, e indicando un torneo seguido de una epifanía.


## Más sobre el territorio

Agregar a cada territorio una cantidad de lembas (galletitas élficas) y una de tabaco, las dos nacen en 10.

Agregar dos nuevas consultas sobre el territorio, su _capitán_ y si _está en paz_ o no; y dos nuevas acciones, la _somnolencia_ y el _consumo de recursos_.

- El _capitán_ de un territorio es el habitante que tiene más habilidad, considerando solamente los seres cuya habilidad esté entre 1000 y 3000. **Ojo:** un ser cuya habilidad sea  4000 nunca va a ser capitán, porque se excede de los 3000, tampoco uno que tenga 800 de habilidad (ni aunque sean los más hábiles).

- El efecto de una _somnolencia_ es indicarle a cada habitante del territorio que _sufre un sueño profundo_. Qué pasa con cada ser cuando sufre un sueño profundo:
	- un elfo se olvida de 10 canciones que sabía, o sea, sabe 10 menos que antes.
	- un hobbit pierde 3 amigos.
	- un enano disminuye su ira en 50 unidades.

- La condición para que un territorio _esté en paz_ es que todos sus habitantes estén conformes con el territorio, de acuerdo a esta definición
	- un elfo está conforme con un territorio, si en el territorio hay al menos 8 unidades de lembas.
	- un hobbit está conforme con un territorio, si en el territorio hay a lo sumo 2 seres que tengan más habilidad que él.
	- un enano está conforme con un territorio, si en el territorio hay a lo sumo 1 habitante torpe.

- El efecto del _consumo de recursos_ es indicarle a cada habitante que _tome recursos **del territorio**_. Qué pasa con cada ser cuando se le indica que tome recursos de un territorio:
	- un elfo saca 3 unidades de lembas, que se restan de la cantidad que tiene el territorio, y aprende 15 canciones (o sea, sabe 15 canciones más que antes).
	- un hobbit saca 4 unidades de tabaco, que se restan de la cantidad que tiene el territorio, gana 7 amigos, y aumenta la cantidad de historias que escuchó tambien en 7 unidades.
	- un enano no hace nada.

### Test de los agregados sobre Territorio:
Agregar los test que verifiquen los agregados sobre Territorio

## Más sobre los enanos

Agregar una nueva acción sobre los enanos, _equilibrarse_, que hace lo siguiente:
- si la habilidad del enano es 700 o menos, entonces adquiere experiencia
- caso contrario, sufre un sueño profundo.

Además, agregar las siguientes variantes de enano: el enano furioso y el enano minero.

Para cada **enano furioso** se define un _tope de habilidad_, que nace en 2000, pero puede variarse libremente. La habilidad de un enano furioso no puede superar el tope indicado.  
**OJO** la ira de un enano furioso no tiene limite, la que se limita es solamente su habilidad.

De cada **enano minero** se conoce el conjunto de sus escondites, puede tener más de uno. A su vez, de cada nido se conoce cuántos candados tiene, y cuánto oro tiene escondido; los valores iniciales son 5 y 3 respectivamente. Un enano minero, cuando nace, no tiene ningún escondite.  
Cuando _adquiere experiencia_, además de lo común para todos los enanos, un enano minero construye un nuevo escondite.  
Cuando _sufre un sueño profundo_ hace lo común a todos los enanos, excepto si tiene más de 2 escondites, en cuyo caso _solamente_ le agrega un candado a cada escondite.  
A la _ira_, sumarle la suma del valor de todos sus escondites. El valor de un escondite se obtiene multiplicando cantidad de candados por cantidad de oro, y sumando 20 al resultado. P.ej. el valor de un escondite con 5 candados y 3 unidades de oro es de 35.

### Test de los enanos:
Agregar los test que verifiquen las partes nuevas de los enanos.
