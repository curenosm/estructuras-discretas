module Util where

import Data.Bits ((.&.))

{-
  Función: esPar
  Descripción: Nos indica si un número entero es par.
  Uso: esPar 45
-}
esPar :: Int -> Bool
esPar a = a .&. 1 == 0

allPairs = [
  p | y <- [0..], p <- [(x, y - x) | x <- [0..y] ]]
