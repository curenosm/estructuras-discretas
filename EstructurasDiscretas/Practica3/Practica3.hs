import Util (esPar)

{-
main :: IO ()
main = do
  putStrLn ("creditos 10 > " ++ show (creditos 10))
  putStrLn ("soloPares [1..10] > " ++ show (soloPares [1 .. 10]))
  putStrLn ("negativos [-1, 2, 4, 6, -4] > " ++ show (negativos [-1, 2, 4, 6, -4]))
  putStrLn ("primos [1..20] > " ++ show (primos [1 .. 20]))
  putStrLn ("coprimos 10 > " ++ show (coprimos 10))
-}

materiasPrimerSemestre =
  [ ("Algebra Superior 1", 10),
    ("Estructuras Discretas", 10),
    ("Ingles 1", 4),
    ("Introducción a las Ciencias de la Computacion", 12)
    ("Matematicas para las Ciencias Aplicadas 1", 12),
  ]

{-
    Función: creditos
    Descripción: Obtiene las materias con dicha cantidad de créditos
        del primestre de la carrera de Ciencias de la Computación.
    Uso: creditos 10
-}
creditos :: Int -> [String]
creditos n = [materia | (materia, creditos) <- materiasPrimerSemestre, creditos == n]

{-
    Función: soloPares
    Descripción: Filtra los numeros en la lista que son pares.
    Uso: soloPares [1..10]
-}
soloPares :: [Int] -> [Int]
soloPares l = [n | n <- l, esPar n]

{-
    Función: negativos
    Descripción: Cuenta los números negativos en una lista.
    Uso: negativos [-3..3]
-}
negativos :: [Int] -> Int
negativos l = sum [if n < 0 then 1 else 0 | n <- l]

{-
    Función: primos
    Descripción: Devuelve la lista de primos en el rango especificado.
    Uso: primos [1..20]
-}
primos :: [Int] -> [Int]
primos l = [p | p <- l, esPrimo p]

{-
    Función: esPrimo
    Descripción: Nos dice si un número es primo, calculando el modulo con
        todos los anteriores para decidir si solo uno (el mismo) le divide.
    Uso: esPrimo 7
-}
esPrimo :: Int -> Bool
esPrimo p = 1 == sum [1 | n <- [2 .. p], (p `mod` n) == 0]

{-
    Función: coprimos
    Descripción: Da la lista de los números menores que n que son coprimos con el mismo.
    Uso: coprimos 10
-}
coprimos :: Int -> [Int]
coprimos a = [n | n <- [1 .. a], sonCoprimos a n]

{-
    Función: sonCoprimos
    Descripción: Nos dice si dos numeros son coprimos, checando si tienen algun factor
    comun.
    Uso: sonCoprimos 1 10
-}
sonCoprimos :: Int -> Int -> Bool
sonCoprimos a b =
  a == 1
    || b == 1
    || 0 == sum [1 | n <- [2 .. (min a b)], a `mod` n == 0, b `mod` n == 0]
