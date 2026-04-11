module Practica5 where

import Auxiliar (charToUpper, myDiv, myMod, myProd, mySum)
import Data.Int (Int)

{-
    Función: hollerBack
    Descripción: Devuelve una cadena convertidos todos sus caracteres en mayuscula.
    Uso: hollerBack "haskell" = "HASKELL"
-}
hollerBack :: String -> String
hollerBack [] = []
hollerBack (x : xs) = (charToUpper x) : hollerBack xs

{-
    Función: decimal_binario
    Descripción: Convierte un numero a su representacion binaria en forma de lista binaria.
    Uso: decimal_binario 5 = [1, 0, 1]
-}
decimal_binario :: Int -> [Int]
decimal_binario 0 = [0]
decimal_binario n = bitsOf n
  where
    bitsOf n = if not (n == 0) then bitsOf (n `div` 2) ++ [n `mod` 2] else []

{-
    Función: replica
    Descripción: Devuelve una lista con el primer argumento repetido un numero de
        veces igual al segundo argumento.
    Uso: replica 2 3 = [2, 2, 2]
-}
replica :: Int -> Int -> [Int]
replica m n
  | n > 0 = m : replica m (n - 1)
  | otherwise = []

{-
    Función: recuperaElemento
    Descripción: Nos devuelve el elemento en la lista ubicado en una posición determinada.
    Uso: recuperaElemento [1, 2, 3] 3 = -1
-}
recuperaElemento :: [Int] -> Int -> Int
recuperaElemento [] _ = -1
recuperaElemento (x : xs) 0 = x
recuperaElemento (x : xs) n = recuperaElemento xs (n - 1)

{-
    Función: rota
    Descripción: Rota los elementos hacia la izquierda en una lista un numero de veces.
    Uso: rota [1, 2, 3] 2 = [2, 1, 3]
-}
rota :: [Int] -> Int -> [Int]
rota [] _ = []
rota l 0 = l
rota (x : xs) n = rota (xs ++ [x]) (n - 1)

{-
    Función: extranio
    Descripción: Devuelve los numeros encontrados durante el procedimiento especificado.
    Uso: extranio 13 = [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
-}
extranio :: Int -> [Int]
extranio 1 = [1]
extranio n = n : extranio (if modulo == 0 then div else addition)
  where
    modulo = myMod n 2
    div = myDiv n 2
    addition = mySum (myProd 3 n) 1
