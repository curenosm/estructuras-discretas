module Proyecto where

import Auxiliar

{-
  Funcion: obtenerFrecuencias
  Descripcion: Cuenta las apariciones de un elemento en una lista.
  Uso: obtenerFrecuencias "AVRAHKADABRA" = [('B', 1) ,('D', 1), ('K' ,1), ('H', 1), ('V', 1), ('R', 2), ('A', 5)]
-}
obtenerFrecuencias :: (Eq a) => [a] -> [(a, Int)]
obtenerFrecuencias [] = []
obtenerFrecuencias (x : xs) =
  let elementosUnicos = unicos (x : xs)
   in ordenarFrecuencias [(c, cuenta (x : xs) c) | c <- elementosUnicos]

{-
  Funcion: ordenarFrecuencias
  Descripcion: Ordena la lista de frecuencias basandote en la cuenta de cada elemento.
  Uso: ordenarFrecuencias [('a', 4), ('b', 1), ('c', 0), ('d', 2)] = [('c', 0), ('b', 1), ('d', 2), ('a', 4)]
-}
ordenarFrecuencias :: (Eq a) => [(a, Int)] -> [(a, Int)]
ordenarFrecuencias [] = []
ordenarFrecuencias ((ci, fi) : xs) =
  let frecuenciasMenores = [(c, f) | (c, f) <- (ci, fi) : xs, f <= fi, ci /= c]
      frecuenciasMayores = [(c, f) | (c, f) <- (ci, fi) : xs, f > fi, ci /= c]
      paresMapeo = ordenarFrecuencias frecuenciasMenores ++ [(ci, fi)] ++ ordenarFrecuencias frecuenciasMayores
   in paresMapeo
