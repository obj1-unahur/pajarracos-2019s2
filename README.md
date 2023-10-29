# Parcial -2023 - T.Noche.

La ornitología es una rama de la zoología que se encarga del estudio de las aves en sus diferentes líneas de investigación. Relacionado a este tema, la universidad nos solicita armar un sistema que permita estudiar el comportamiento de algunas aves que viven en unas islas muy particulares. Las definiciones incluyen varias etapas en el desarrollo.

## Algunas aves

En esta etapa tenemos que modelar algunas de las aves. De cada ave nos interesa saber su **fuerza** (que es un número). Por otra parte, la dinámica del vivir en las islas incluye circunstancias en las que un ave **recibe un disgusto**; para cada ave se define qué debe hacer en tal caso.

Inicialmente se definen tres especies de aves: aguiluchos, albatros y palomas.

#### Aguiluchos
De cada aguilucho se conoce su velocidad, que inicialmente es de 20 km/h pero puede aumentar de acuedo a determinados eventos.  
La **fuerza** se calcula en base a su velocidad: si es de 60 km/h o menos entonces es 180; en caso contrario, es el triple de la velocidad.
Al **recibir un disgusto**, duplica su velocidad. O sea, un aguilucho cuya velocidad es 40 km/h tiene 180 de fuerza. Si recibe un disgusto, su velocidad pasa a 80 km/h, y por lo tanto, su fuerza se calcula como 240.

#### Albatros
Para los albatros, la fuerza se define en base al peso y la masa muscular. Cuando nace un albatros pesa 4000 gramos, y tiene 600 de masa muscular.  
Su **fuerza** se calcula así: si pesa menos de 6000 gramos, entonces coincide con la masa muscular; en caso contrario, es la mitad.
Cuando **recibe un disgusto**, su peso aumenta en 800 gramos.  
Para los albatros se define una acción adicional que es _ir al gimnasio_: el efecto es que la masa muscular y el peso aumentan en 500 gramos.

#### Palomas
Para las palomas, la fuerza se calcula a partir de su ira. Cuando se crea una paloma, su ira es de 200 unidades.  
La **fuerza** de una paloma es el doble de su ira.
Cuando **recibe un disgusto**, su ira aumenta en 300 unidades.

## Aves especiales

También debemos contemplar dos tipos especiales de aves: los aguiluchos colorados y las palomas torcazas.

La fuerza de un **aguilucho colorado** es de 400 unidades más de lo que correspondería según el cálculo de un aguilucho común de sus mismas características.

Para una **paloma torcaza**, la fuerza aumenta en 100 unidades por cada uno de sus huevos. En esta isla especial cuando se crea una paloma torcasa tiene 3 huevos.. Cuando recibe un disgusto, además de la acción común a todas las palomas, pone un huevo.


## Islas Especiales

En nuestro estudio se incluye muchas **islas**. En cada isla hay aves.

Se pide modelar las islas, de forma de poder realizar lo que sigue:

- obtener las _aves débiles_ de una isla, son aquellas cuya fuerza sea menor a 1000.
- obtener la _fuerza total_ de una isla, que es la suma de la fuerza de cada una de sus aves.
- poder averiguar si una isla _es robusta_: la condición es que todas sus aves tengan una fuerza mayor a 300.
- indicar que hubo un _terremoto_: todas las aves deben recibir un disgusto.
- indicar que hubo una _tormenta_: todas las _aves débiles_ deben recibir un disgusto.


## Test de isla y aves

Armar los test solicitados con el siguiente escenario.
- crear un aguilucho colorado, un albatros y una paloma torcaza y crear una isla.
- La incializacion del escenario debe hacer lo siguiente:
Agregar a las tres aves a la isla, y después, hacer que el albatros vaya al gimnasio. Sería algo así:
```
describe "Test de islas y aves" {
	const agc = new AguiluchoColorado()
	const alb = new Albatro()
	const pat = new PalomaTorcaza()
	const i1 = new Isla()
	method initialize() {
		i1.agregarAve(agc)
		i1.agregarAve(alb)
		i1.agregarAve(pat)
		alb.irAlGimnasio()
	}	
}
```

Verificar en un test individal cada una de las siguientes aseveraciones.
- la fuerza del aguilucho debe ser 580, la del albatros 1100, y la de la paloma 700 respectivamente.
- el peso del albatros debe ser 4500.
- la fuerza total de la isla es 2380.
- las aves débiles de la isla son el aguilucho y la paloma.


A partir de la situación inicial, indicar que en la isla hubo un terremoto. Después de esto validar en un solo y único test las siguientes aseveraciones.
* la velocidad del aguilucho debe aumentar a 40,
* el peso del albatros a 5300,
* y la ira de la paloma a 500.

La fuerza del aguilucho sigue siendo 580, la del albatros sigue siendo 1100, la de la paloma pasa a 1400. Por lo tanto, la única ave débil es ahora el aguilucho.

Finalmente, indicar que en la isla hubo una tormenta después del terremoto. La velocidad del aguilucho debe pasar a 80, y su fuerza a 640. El peso del albatros y la ira de la paloma deben ser igual que antes.  
Este último test se puede hacer también partiendo de la situación inicial, e indicando un terremoto seguido de una tormenta.


## Más sobre la isla

Agregar a cada isla una cantidad de alpiste y una de maíz, las dos nacen en 10.

Agregar dos nuevas consultas sobre la isla, su _ave capitana_ y si _está en paz_ o no; y dos nuevas acciones, la _sesión de relax_ y la _alimentación_.

- El _ave capitana_ de una isla es la que tiene más fuerza, considerando solamente aquellas **_aves candidatas_** cuya fuerza esté entre 1000 y 3000. En el caso de no haya capitana enviar un mensaje de error "No hay candidatas para ser capitanas". **Ojo:** un ave de 4000 unidades de fuerza nunca va a ser capitana, porque se excede de los 3000, tampoco una de 800 ni aunque sean las más fuertes. Armar el test correspondiente para validar que el albatro sea el ave candidata en el escenario de las tres aves de la etapa 1. Armar un segundo test que saque al albatro de la isla y validar que no haya aves candidatas a través del mensaje de error.



- El efecto de una _sesión de relax_ es indicarle a cada ave que _se relaje_. Qué pasa con cada ave cuando se relaja:
	- un aguilucho aumenta su velocidad en 10 km/h. Considerar que la velocidad nunca puede superar los 150 kms/h
	- un albatros pierde 300 gramos de peso. 
	- dependiendo de que tan buena sea la sesión de relax una paloma torcaza disminuye su ira en un número aleatorio entre 25 y 50. Mientras que a una paloma común la sesión de relax no le produce ningún efecto. Considerar que las unidades de peso e ira nunca pueden ser negativas. 


- La condición para que una isla _esté en paz_ es que todas las aves estén conformes con la isla, de acuerdo a esta definición. (**Ayuda**, el ave debe tener la responsabilidad de saber si esta conforme o no con la isla en la que habita.)
	- un aguilucho está conforme con una isla, si en la isla hay al menos 8 unidades de alpiste.
	- un albatros está conforme con una isla, si en la isla hay a lo sumo 2 aves que tengan más fuerza que él.
	- una paloma está conforme con una isla, si en la isla hay a lo sumo 1 ave débil que no sea ella misma.

- Armar el test que valida que cada ave este conforme o no con la isla y luego el test para determinar si la isla esta en paz o no.
	- La paloma torcaza está conforme con la isla.(en la isla hay otra ave que es débil y no es ella misma)
	- El aguiluco colorado está conforme con la isla (en la isla hay alpiste suficiente)
	- El albatro No esta conforme con la isla.
	- La isla no esta en paz.

- El efecto de la _alimentación_ es indicarle a cada ave que _tome alimento **de la isla**_. Qué pasa con cada ave cuando se le indica que tome alimento de una isla:
	- un aguilucho saca 3 unidades de alpiste, que se restan de la cantidad que tiene la isla, y aumenta su velocidad en 15 km/h.
	- un albatros saca 4 unidades de maíz, que se restan de la cantidad que tiene la isla, y aumenta tanto su peso como su masa muscular en 700 gramos.
	- una paloma no hace nada.



## Más sobre las palomas

Agregar una nueva acción sobre las palomas, _equilibrarse_, que hace lo siguiente:
- si la fuerza de la paloma es 700 o menos, entonces recibe un disgusto
- caso contrario, se relaja.

Además, agregar las siguientes variantes de paloma: la paloma montera y la paloma manchada.

Para cada **paloma montera** se define un _tope de fuerza_ que es común a todas las palomas monteras cuyo valor inicial es de 2000, pero puede variarse libremente. La fuerza de una paloma montera nnunca puede superar el tope indicado.

De cada **paloma manchada** se conoce el conjunto de sus nidos, puede tener más de uno. A su vez, de cada nido se conoce el grosor y la resistencia del material; los valores iniciales son 5 y 3 respectivamente. Una paloma manchada nace sin ningún nido.  
Cuando _recibe un disgusto_, además de lo que hacen todas las palomas, una paloma manchada construye un nuevo nido.  
Cuando _se relaja_ hace lo mismo que cualquier otra paloma, excepto si tiene más de 2 nidos, en cuyo caso aumenta el grosor de todos los que tenga en 1 unidad.  
A la _ira_, sumarle la suma de la potencia de todos sus nidos. La potencia de un nido se obtiene multiplicando grosor por resistencia, y sumando 20 al resultado. P.ej. la potencia de un nido con 5 de grosor y 3 de resistencia es de 35.
