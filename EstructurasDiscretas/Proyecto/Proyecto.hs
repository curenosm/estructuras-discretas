module Proyecto where

palabraPrueba :: String
palabraPrueba = "AVRAHKADABRA"

{-
  Funcion: concatenaListas
  Descripcion: Concatena todas las listas del primer argumento en una sola.
  Uso: concatenaListas [[1], [2, 3], [4, 5]] = [1, 2, 3, 4, 5]
-}
concatenaListas :: [[a]] -> [a]
concatenaListas [] = []
concatenaListas (x : xs) = x ++ concatenaListas xs

{-
  Funcion: contiene
  Descripcion: Verifica si una lista contiene al elemento especificado.
  Uso: contiene [1, 2, 3, 4, 5] 4 = True
-}
contiene :: (Eq a) => [a] -> a -> Bool
contiene [] e = False
contiene (x : xs) e = (x == e) || contiene xs e

{-
  Funcion: unicos
  Descripcion: Devuelve los elementos en una lista, pero sin repeticiones.
  Uso: unicos [1, 1, 3, 4, 5, 2, 2] = [1, 3, 4, 5, 2]
-}
unicos :: (Eq a) => [a] -> [a]
unicos [] = []
unicos (x : xs) = if contiene ultimosUnicos x then ultimosUnicos else x : ultimosUnicos
  where
    ultimosUnicos = unicos xs

{-
  Funcion: cuenta
  Descripcion: Cuenta las apariciones de un elemento en una lista.
  Uso: cuenta [1, 1, 3, 4, 5, 2, 2] 8 = 0
-}
cuenta :: (Eq a) => [a] -> a -> Int
cuenta [] c = 0
cuenta (x : xs) c = cuenta xs c + if x == c then 1 else 0

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
