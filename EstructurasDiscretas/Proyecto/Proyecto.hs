module Proyecto where

import Auxiliar
import GHC.Float (int2Float)

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

{-
  Funcion: construyeArbol
  Descripcion:
  Uso: construyeArbol "AVRAHKADABRA" =
    (AB 12 (AB 7 (AB 4 (AB 2 (Hoja B 1) (Hoja D 1)) (AB 2 (Hoja K 1) (Hoja H 1))) (AB 3 (Hoja V 1) (Hoja R 2))) (Hoja A 5))
-}

{-
  Funcion: construyeIterativamente
  Descripcion:
  Uso: construye (obtenerFrecuencias "AVRAHKADABRA") [] [] =
    [Hoja 'A' 5, AB 3 (Hoja 'V' 1) (Hoja 'R' 2), AB 2 (Hoja 'K' 1) (Hoja 'H' 1), AB 2 (Hoja 'B' 1) (Hoja 'D' 1)]
-}

{-
  Funcion: obtenerHojas
  Descripcion: Nos permite formar las hojas a partir de las cuales construiremos el arbol.
  Uso: obtenerHojas (obtenerFrecuencias ejemploPalabra)
-}
obtenerHojas :: (Eq a) => [(a, Int)] -> [Arbol a]
obtenerHojas fs = [Hoja c f | (c, f) <- fs]

{-
  Funcion: construye
  Descripcion: Nos permite construir el arbol iterativamente, procesando aquellos nodos con valor
    menor primero.
  Uso: construye hojas []
-}

{-
  Funcion: tamanioPromedio
  Descripcion: Calcula el tamanio promedio de cualquier conjunto de simbolos.
  Uso: tamanioPromedio "AVRAHKADABRA" = 0.0
-}

{-
  Funcion: caminosCodificados
  Descripcion: Nos permite obtener las cadenas para recorrer el árbol de codificación.
  Uso: caminosCodificados [] () ""
-}

{-
  Funcion: sumaPonderada
  Descripcion: Calcula la suma ponderando la frecuencia de un caracter con la longitud
    de cada camino a un caracter en el árbol codificado.
  Uso: sumaPonderada [('a', 1)] [('a', "1")] 1 = 1
-}
sumaPonderada :: (Eq a) => [(a, Int)] -> [(a, String)] -> Int -> Float
sumaPonderada [] _ n = 0
sumaPonderada _ [] n = 0
sumaPonderada ((a, fa) : frecuencias) ((b, lb) : longitudes) n =
  let sumaActual = int2Float (fa * length lb)
      cur = (sumaActual / int2Float n)
   in cur + sumaPonderada frecuencias longitudes n

{-
  Funcion: decodifica
  Descripcion: Dados un arbol de Huffman y una cadena, descodificala.
  Uso: decodifica arbolEjemplo arbolEjemplo "101001110011001010001100000111" = "AVRAHKADABRA"
-}
