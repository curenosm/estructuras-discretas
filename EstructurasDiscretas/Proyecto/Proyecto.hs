module Proyecto where

import Auxiliar
import GHC.Float (int2Float)

{-
  Función: obtenerFrecuencias
  Descripción: Cuenta las apariciones de un elemento en una lista.
  Uso: obtenerFrecuencias "AVRAHKADABRA" = [('B', 1) ,('D', 1), ('K' ,1), ('H', 1), ('V', 1), ('R', 2), ('A', 5)]
-}
obtenerFrecuencias :: (Eq a) => [a] -> [(a, Int)]
obtenerFrecuencias [] = []
obtenerFrecuencias (x : xs) =
  let elementosUnicos = unicos (x : xs)
   in ordenarFrecuencias [(c, cuenta (x : xs) c) | c <- elementosUnicos]

{-
  Función: ordenarFrecuencias
  Descripción: Ordena la lista de frecuencias basándote en la cuenta de cada elemento.
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
  Función: construyeArbol
  Descripción:
  Uso: construyeArbol "AVRAHKADABRA" =
    (AB 12 (AB 7 (AB 4 (AB 2 (Hoja B 1) (Hoja D 1)) (AB 2 (Hoja K 1) (Hoja H 1))) (AB 3 (Hoja V 1) (Hoja R 2))) (Hoja A 5))
-}
construyeArbol :: (Eq a) => [a] -> Arbol a
construyeArbol palabra =
  if null palabra
    then Vacio
    else
      let frecuencias = obtenerFrecuencias palabra
       in construyeIterativamente frecuencias

{-
  Función: construyeIterativamente
  Descripción:
  Uso: construyeIterativamente (obtenerFrecuencias "AVRAHKADABRA") =
    [Hoja 'A' 5, AB 3 (Hoja 'V' 1) (Hoja 'R' 2), AB 2 (Hoja 'K' 1) (Hoja 'H' 1), AB 2 (Hoja 'B' 1) (Hoja 'D' 1)]
-}
construyeIterativamente :: (Eq a) => [(a, Int)] -> Arbol a
construyeIterativamente fs =
  let hojas = obtenerHojas fs
      acc = construye hojas []
   in case acc of
        [] -> Vacio
        [x] -> x
        (Hoja c fc : AB r1 i1 d1 : xs) -> AB (fc + r1) (AB r1 i1 d1) (Hoja c fc)
        (Hoja a fa : Hoja b fb : AB r1 i1 d1 : xs) -> AB (fa + fb + r1) (AB (fa + fb) (Hoja a fa) (Hoja b fb)) (AB r1 i1 d1)
        _ -> Vacio

{-
  Función: obtenerHojas
  Descripción: Nos permite formar las hojas a partir de las cuales construiremos el arbol.
  Uso: obtenerHojas (obtenerFrecuencias ejemploPalabra)
-}
obtenerHojas :: (Eq a) => [(a, Int)] -> [Arbol a]
obtenerHojas fs = [Hoja c f | (c, f) <- fs]

{-
  Función: construye
  Descripción: Nos permite construir el árbol iterativamente, procesando aquellos nodos con valor
    menor primero.
  Uso: construye hojas []
-}
construye :: (Eq a) => [Arbol a] -> [Arbol a] -> [Arbol a]
construye [] res = res
construye ((Hoja c f) : fs) [] = construye fs [Hoja c f]
construye ((Hoja c f) : fs) [Hoja a fa] = construye fs [Hoja c f, Hoja a fa]
construye ((AB r i d) : fs) [] = construye fs [AB r i d]
construye ((AB r1 i1 d1) : fs) [AB r2 i2 d2] = construye fs [AB r1 i1 d1, AB r2 i2 d2]
construye fs (Hoja b fb : Hoja a fa : xs) = construye fs (AB (fa + fb) (Hoja a fa) (Hoja b fb) : xs)
construye fs (AB r2 i2 d2 : AB r1 i1 d1 : xs) = construye fs (AB (r1 + r2) (AB r1 i1 d1) (AB r2 i2 d2) : xs)
construye ((Hoja c f) : fs) (AB r i d : xs) = construye fs (Hoja c f : AB r i d : xs)
construye ((Hoja c f) : fs) (Hoja c1 f1 : AB r i d : xs) = construye fs (Hoja c f : Hoja c1 f1 : AB r i d : xs)

{-
  Función: tamanioPromedio
  Descripción: Calcula el tamanio promedio de cualquier conjunto de símbolos.
  Uso: tamanioPromedio "AVRAHKADABRA" = 2.5
-}
tamanioPromedio :: (Eq a) => [a] -> Float
tamanioPromedio simbolos =
  let arboles = construyeArbol simbolos
      frecuencias = obtenerFrecuencias simbolos
      caminos = caminosCodificados arboles ""
      n = length simbolos
   in sumaPonderada frecuencias caminos n

{- 
  Función: diferenciaPercentual
  Descripción: Retorna cuánto más grande es (en bytes) la primera cadena
    respecto a la segunda en porcentaje.
  Uso: diferenciaPercentual ejemploPalabra ejemploPalabraCodificada = 
-}
diferenciaPercentual :: String -> String -> Float
diferenciaPercentual cadenaOriginal cadenaCodificada =
    let b1 = fromIntegral (bytes cadenaOriginal)
        b2 = (bytes cadenaCodificada) `div` 8
    in ((b1 - fromIntegral b2) / fromIntegral b2) * 100

{-
  Función: caminosCodificados
  Descripción: Nos permite obtener las cadenas para recorrer el árbol de codificación.
  Uso: caminosCodificados arbolEjemplo ""
-}
caminosCodificados :: (Eq a) => Arbol a -> [Char] -> [(a, String)]
caminosCodificados (Hoja c fc) camino = [(c, camino)]
caminosCodificados (AB r i d) camino =
  caminosCodificados i (camino ++ ['0']) ++ caminosCodificados d (camino ++ ['1'])

{-
  Función: codifica
  Descripción: Utiliza un árbol de Huffman y una cadena para codificarla en una cadena binaria.
  Uso: codifica arbolEjemplo palabraEjemplo = ""
-}
codifica :: (Eq a) => Arbol a -> [a] -> String
codifica arbol [] = []
codifica arbol letras =
  let caminos = caminosCodificados arbol ""
      codificacionCaracterActual = head [path | (c, path) <- caminos, c == (head letras)]
  in codificacionCaracterActual ++ codifica arbol (tail letras)

{-
  Función: sumaPonderada
  Descripción: Calcula la suma ponderando la frecuencia de un caracter con la longitud
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
  Función: decodifica
  Descripción: Dados un árbol de Huffman y una cadena, decodificala.
  Uso: decodifica arbolEjemplo arbolEjemplo "101001110011001010001100000111" = "AVRAHKADABRA"
-}
decodifica :: Arbol Char -> String -> String
decodifica arbol = helper arbol arbol
  where
    helper raiz (Hoja a fa) "" = [a]
    helper raiz (AB r i d) "" = []
    helper raiz (Hoja a fa) cadena = a : helper raiz raiz cadena
    helper raiz (AB r i d) cadena =
      if head cadena == '1'
        then helper raiz d (tail cadena)
        else helper raiz i (tail cadena)
