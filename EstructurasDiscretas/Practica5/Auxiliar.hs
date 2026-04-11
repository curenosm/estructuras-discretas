module Auxiliar where

import Data.Bits
import Data.Char (chr, ord)

data Natural = Cero | S Natural deriving (Eq, Show)

{-
    Función: mySum
    Descripción: Transforma los argumentos a naturales y obtiene la suma.
    Uso: mySum 10 + 10 = 0
-}
mySum :: Int -> Int -> Int
mySum a b = a_entero (suma_nat (a_natural a) (a_natural b))

{-
    Funcion: myProd
    Descripción: Transforma los argumentos a naturales y obtiene el producto
        de ambos.
    Uso: myProd 5 3 = -15
-}
myProd :: Int -> Int -> Int
myProd a b = a_entero (multiplica_nat (a_natural a) (a_natural b))

{-
    Función: myDiv
    Descripción: Transforma los argumentos a naturales y obtiene la division del
        primero entre el segundo.
    Uso: myDiv 10 2 = 5
-}
myDiv :: Int -> Int -> Int
myDiv n d = a_entero (divide_nat (a_natural n) (a_natural d))

{-
    Función: myMod
    Descripción: Transforma los argumentos a naturales y obtiene el modulo.
    Uso: myMod 10 2 = 0
-}
myMod :: Int -> Int -> Int
myMod n d = a_entero (mod_nat (a_natural n) (a_natural d))

{-
    Función: suma_nat
    Descripción: Calcula la suma de dos naturales
    Uso 1: suma_nat Cero (S Cero) = S Cero
    Uso: suma_nat (S (S (S Cero))) (S (S (S (S Cero)))) = S (S (S (S (S (S (S Cero))))))
-}
suma_nat :: Natural -> Natural -> Natural
suma_nat Cero n = n
suma_nat (S m) n = suma_nat m (S n)

{-
    Función: multiplica_nat
    Descripción: Calcula el producto de dos naturales
    Uso: multiplica_nat (S (S (S Cero))) (S (S (S (S Cero)))) = S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))
-}
multiplica_nat :: Natural -> Natural -> Natural
multiplica_nat Cero n = Cero
multiplica_nat (S m) n = suma_nat n (multiplica_nat m n)

{-
    Función: divide_nat
    Descripción: Calcula el resultado de dividir el primer natural entre el segundo.
    Uso: divide_nat (S (S (S (S Cero)))) (S (S Cero)) = Cero
-}
divide_nat :: Natural -> Natural -> Natural
divide_nat n Cero = error "You can't divide by zero"
divide_nat Cero n = Cero
divide_nat m n =
  if a_entero m == a_entero n
    then (S Cero)
    else
      if mayorIgual m n
        then (S (divide_nat (resta_nat m n) n))
        else Cero

{-
    Función: resta_nat
    Descripción: Calcula la resta del primer argumento menos el segundo, cuidando no
        salirnos de los naturales.
    Uso: resta_nat (S (S Cero)) (S Cero) = (S Cero)
-}
resta_nat :: Natural -> Natural -> Natural
resta_nat Cero _ = Cero
resta_nat m Cero = m
resta_nat (S m) (S n) = resta_nat m n

{-
    Funcion: mayorIgual
    Descripcion: Nos dice si el primer natural es mayor o igual al segundo.
    Uso: mayorIgual (S (S Cero)) Cero = True
-}
mayorIgual :: Natural -> Natural -> Bool
mayorIgual Cero Cero = True
mayorIgual _ Cero = True
mayorIgual Cero _ = False
mayorIgual (S m) (S n) = mayorIgual m n

{-
    Función: mod_nat
    Descripción: Calcula el modulo (residuo) de la division del primero entre el segundo.
    Uso: divide_nat (S (S (S Cero))) (S (S (S (S Cero)))) = S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))
-}
mod_nat :: Natural -> Natural -> Natural
mod_nat n Cero = error "You can't divide by zero"
mod_nat Cero n = Cero
mod_nat m n =
  if a_entero m == a_entero n
    then Cero
    else
      if mayorIgual m n
        then (mod_nat (resta_nat m n) n)
        else m

{-
    Funcion: a_natural
    Descripcion: Convierte un Int a un natural.
    Uso: a_entero (S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))) = 12
-}
a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n

{-
    Funcion: a_natural
    Descripcion: Convierte un Int a un natural.
    Uso: a_natural 12 = S (S (S (S (S (S (S (S (S (S (S (S Cero)))))))))))
-}
a_natural :: Int -> Natural
a_natural n
  | (n < 0) = error "Los naturales solo incluyen a los enteros no negativos!"
  | (n == 0) = Cero
  | otherwise = S (a_natural (n - 1))

{-
    Función: charToUpper
    Descripción: Convierte un caracter a su version mayuscula.
    Uso: charToUpper 'a' = 'A'
-}
charToUpper :: Char -> Char
charToUpper c =
  let intermediateChars = 6
   in if ord_a <= ord_c && ord_c < ord_z + 1
        then chr ((ord c) - (26 + intermediateChars))
        else c
  where
    ord_a = ord 'a'
    ord_c = ord c
    ord_z = ord 'z'
