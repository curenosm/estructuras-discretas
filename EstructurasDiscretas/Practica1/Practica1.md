# Práctica 1

## Preguntas

1. ¿Cuáles son las principales diferencias entre `Haskell` y `Racket`?

    *Re*: Principalmente, `Racket` es un dialecto perteneciente a la familia de `Lisp`, en cuyo
    nombre mismo radica la esencia del lenguaje, `Lisp` es un acronimo de _List Processing_,
    las listas (s-expressions) son el principal componente en `Lisp`, tanto en estructuras de
    datos, como en la organizacion de los programas, `Racket` en particular es un lenguaje que
    fue pensado para la enseñanza e implementación de interpretes y compiladores sobre el
    lenguaje, es de tipado fuerte dinámico (con la opción para utilizar tipado estático),
    lo que significa que las variables pueden cambiar el tipo de dato que albergan en tiempo
    de ejecución, y además es un lenguaje que compila a un bytecode.

    `Haskell` por otro lado es un lenguaje de alto nivel funcional puro, con tipado estatico
    fuerte que en pocas palabras significa que el compilador puede verificar la validez de los
    tipos en tiempo de compilación, muy relacionada con esta última característica están la
    inferencia de tipos (lo que hace que no tengamos que estar especificando explícitamente el
    tipo de las variables) y el pattern matching (que nos facilita la implementación de
    algoritmos de forma más expresiva), por último una caracteristica que diferencia a `Haskell`
    es su evaluación perezosa, lo cual significa que las cosas se computan de manera última
    a medida que se necesiten, lo cual mejora el rendimiento de los cómputos.

2. ¿Cuáles son las principales diferencias entre `Haskell` y `Java`?

    **Re**: Como ya se ha mencionado antes en las caracteristicas de `Haskell` se trata de un
    lenguaje perteneciente al paradigma funcional, donde usualmente se suelen hacer cómputos
    indicando el qué es cada cosa, esto es, de un modo más declarativo. 

    `Java` por otro lado pertenece al estilo imperativo (aunque en ultimas versiones se puede
    escribir código mucho más declarativo) en particular al paradigma de la orientación a
    objetos, en donde computamos y modelamos situaciones de la vida real utilizando el concepto
    de _objetos_ que componen una jerarquía de tipos, en donde cada tipo consta de atributos
    y comportamiento, funcionando cada instancia del tipo como una entidad con estado que
    puede interactuar o no con otras de diversas maneras. También cuenta con la característica
    de tener un sistema de tipos fuerte y estático.

3. ¿Por qué `Haskell` no alcanza una adopación significativa en la industria del software?

    **Re**: Yo opino que mientras que los paradigmas procedural y orientado a objetos nos
    permiten realizar operaciones de manera imperativa, diciendo el cómo se hace cada cosa
    más que el qué es cada cosa; para trabajar en el paradigma funcional uno muchas veces
    hace uso de la recursión, en lugar de la modificación de estado de alguna variable por
    ejemplo. Esto hace que requiera un poco más de esfuerzo en general escribir el código,
    pues tenemos que tomar consideraciones particulares de acuerdo al paradigma, a
    diferencia de otros lenguajes más "comerciales" por así decirlo en donde podemos por
    ejemplo declarar variables que luego libera el recolector de basura, o hacer uso de
    los conocidos ciclos for imperativos de toda la vida, que facilitan la introducción de
    profesionales con diferentes backgrounds y especialidades a proyectos de software.

4. Si pudieras realizar una simple analogía entre `Git` y `Github` ¿Cuál se te vendría a la mente.

    **Re**: Una analogía sencilla sería que pensaramos en `Git` y `GitHub` como cuando desde
    nuestro dispositivo movil queremos sincronizar archivos hacia la nube, en este caso, un
    repositorio de `Git` equivale a una de nuestras fotos en el dispositivo, mientras que la
    copia que se hace en la nube debida a la sincronización sería el equivalente a nuestro
    repositorio en `GitHub`, podemos recortar una foto o ponerle un filtro desde nuestro
    teléfono sin volver a sincronizar con la nube, pero si quieres descargarla de nuevo desde
    tu PC o que tu abuelita la descargue (pues ella aparece en ella), quizá sea conveniente
    subir estos cambios de nuevo a la nube (`GitHub`).

    En esencia es eso, aunque `GitHub` tiene muchas funciones más que nos permiten colaborar,
    formar de organizaciones, el seguimiento de repositorios (de modo que podamos estar al
    pendiente de las últimas versiones de nuestros programas favoritos), e incluso automatizar
    procesos relacionados a la integración y entrega continua de sistemas de software.

## Referencias

Otros cursos de la facultad.
