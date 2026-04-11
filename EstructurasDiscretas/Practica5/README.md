# Practica 5

## Objetivos

Seguir practicando la programación funcional en `Haskell`.

## Tiempo Requerido

3 horas.

## Preguntas

1. ¿Qué es la recursión de cola?

    Es una técnica de optimización de programación en la cual utilizamos los argumentos
    mismos de la llamada a la funcion para evitar alojar tantas llamadas al stack
    cuando utilizamos funciones recursivas, esto asegurando que la llamada a la función
    recursiva, asegurando de esta manera una mejor gestión de los recursos, en particular
    la memoria del stack, haciendo menos probable una excepción del tipo _Stack Overflow_.

2. ¿Cuál es la relación entre las funciones de órden superior `foldr` y `foldl` con
este tipo de recursión.

    Dichas funciones se utilizan para colapsar una lista de elementos a un valor 
    calculado mediante la iteracion sobre todos ellos, para la primera de las funciones,
    la función `foldl` el proceso de iteración se realiza de izquierda a derecha, entre las
    ventajas de su uso se encuentra la optimización por recursión de cola con que se
    implementó en `Haskell`, mientras que para `foldr` el mismo se efectúa de derecha a
    izquierda además de que no contamos con esa ventaja de optimización.
