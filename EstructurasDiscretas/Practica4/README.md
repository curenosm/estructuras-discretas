# Práctica 4

## Objetivos

El objetivo de esta práctica es agregar las listas por compresión 
a nuestro acervo de técnicas para la programación con `Haskell`, un método
declarativo para especificar los elementos que constituyen a una lista
con notación similar a la de conjuntos, común en matemáticas.

## Tiempo Requerido

3 horas.

## Actividades

1. ¿Cuál es la diferencia de las operaciones implementadas en ambos archivos?
¿Cómo se manejan todos los casos en cada implementación?

    En el archivo del repositorio, la operación de suma y sus casos base
    fueron simplificados respecto al archivo adjunto, por lo que ahora son
    menos redundantes dado que se efectúa la misma operacion tanto si un
    entero es negativo como si no al recibir un `CERO`.

    También los casos recursivos se simplificaron pues para la suma no
    se compara la igualdad de los valores absolutos antes de llamar a la 
    función resta sino que se delega a la función resta para que lo maneje
    por si misma y además en la resta de nuevo se redujo la redundancia de
    los casos recursivos.

2. ¿Por qué se tiene implementada la operación `mayorEnt` en el archivo
`enteros.hs`?

    Para poder restar apropiadamente dos enteros, pues necesitamos
    asegurar que obtenemos el valor absoluto de la diferencia entre los
    enteros para después cambiar el signo si el segundo argumento es mayor
    que el primero.

3. Si pudieras quedarte con una sola implementación. ¿Cuál sería? Justifica 
tu respuesta.

    En lo personal elegiría la implementación del repositorio, pues tenemos
    menos casos base tanto para la suma como la resta lo cual facilita la 
    legibilidad y la mantenibilidad de nuestro programa.
    
    Además de que no requerimos hacer uso de la función `mayorQue`.
