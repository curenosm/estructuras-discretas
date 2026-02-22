import Data.Bits

-- Author: Misael Cureño Sanchez

{-
  Función: Calcula el factorial de un número.
  Descripción: Multiplica recursivamente decrementando hasta llegar a uno.
  Uso: factorial 5
-}
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

{-
  Función: sayHello
  Descripción: Imprime un mensaje en la salida estándar.
  Uso: sayHello "Haskell"
-}
sayHello :: String -> IO ()
sayHello arg = do
  putStrLn ("Hello " ++ arg ++ "!")

{-
  Función: calcularPropina
  Descripción: Obtiene el 10 por ciento de la cuenta y lo devuelve.
  Uso: calcularPropina 1000
-}
calcularPropina :: Int -> Int
calcularPropina cuenta = round (0.10 * fromIntegral cuenta)

{-
  Función: menor
  Descripción: Devuelve el menor de tres números.
  Uso: menor 123 4 56
-}
menor :: Int -> Int -> Int -> Int
menor a b c
  | a <= b && a <= c = a
  | b <= a && b <= c = b
  | c <= a && c <= b = c
  | otherwise = 0

{-
  Función: decide
  Descripción: Si la primera entrada es verdadera devuelve el segundo argumeno
    en otro caso devuelve el tercer argumento.
  Uso: decide True "primera" "segunda"
-}
decide :: Bool -> String -> String -> String
decide chooseFirst a b = if chooseFirst then a else b

{-
  Función: esDescendiente
  Descripción: Nos indica si el orden en que se pasaron los argumentos
    es estrictamente decreciente.
  Uso: esDescendiente 10 9 8 7
-}
esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente x y z w = x > y && y > z && z > w

{-
  Función: esDivisible
  Descripción: Nos dice si el primer número es divisible
    o no entre el segundo.
  Uso: esDivisible 4 2
-}
esDivisible :: Int -> Int -> IO ()
esDivisible a b = do
  if b == 0
    then putStrLn "No se puede dividir entre cero."
    else
      putStrLn
        ( show a
            ++ (if a `mod` b > 0 then " no" else "")
            ++ " es divisible por "
            ++ show b
        )

{-
  Función: esPar
  Descripción: Nos indica si un número entero es par.
  Uso: esPar 45
-}
esPar :: Int -> Bool
esPar a = a .&. 1 == 0

{-
  Función: hipotenusa
  Descripción: Calcular la hipotenusa dados los dos catetos.
  Uso: hipotenusa 9.0 12.0
-}
hipotenusa :: Float -> Float -> Float
hipotenusa b h = sqrt (b * b + h * h)

{-
  Función: pendiente
  Descripción:
  Uso: pendiente (3.0, 2.0) (7.0, 8.0)
-}
pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1, y1) (x2, y2) = (y2 - y1) / (x2 - x1)

{-
  Función: distanciaPuntos
  Descripción: Calcula la distancia entre dos puntos
  Uso: distanciaPuntos (2.0, 1.0) (5.0, 5.0)
-}
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

{-
  Función: cuadrados
  Descripción: Eleva al cuadrado cada número sin utilizar `map`.
  Uso: cuadrados [1..5]
-}
cuadrados :: [Int] -> [Int]
cuadrados input = [x * x | x <- input]
