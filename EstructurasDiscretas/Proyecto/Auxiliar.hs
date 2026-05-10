module Auxiliar where

data Arbol a
  = Vacio
  | Hoja a Int
  | AB Int (Arbol a) (Arbol a)
  deriving (Show, Eq)

-- Datos de Prueba

ejemploPalabra :: String
ejemploPalabra = "AVRAHKADABRA"

ejemploPalabraCodificada :: String
ejemploPalabraCodificada = "101001110011001010001100000111"

ejemploArbol :: Arbol Char
ejemploArbol =
  AB
    12
    ( AB
        7
        ( AB
            4
            ( AB
                2
                (Hoja 'B' 1)
                (Hoja 'D' 1)
            )
            ( AB
                2
                (Hoja 'K' 1)
                (Hoja 'H' 1)
            )
        )
        ( AB
            3
            (Hoja 'V' 1)
            (Hoja 'R' 2)
        )
    )
    (Hoja 'A' 5)

ejemploConstruye :: [Arbol Char]
ejemploConstruye =
  [Hoja 'A' 5, AB 7 (AB 4 (AB 2 (Hoja 'B' 1) (Hoja 'D' 1)) (AB 2 (Hoja 'K' 1) (Hoja 'H' 1))) (AB 3 (Hoja 'V' 1) (Hoja 'R' 2))]

ejemploFrecuencias :: [(Char, Int)]
ejemploFrecuencias =
  [ ('B', 1),
    ('D', 1),
    ('K', 1),
    ('H', 1),
    ('V', 1),
    ('R', 2),
    ('A', 5)
  ]

ejemploCaminos :: [(Char, String)]
ejemploCaminos =
  [ ('B', "0000"),
    ('D', "0001"),
    ('K', "0010"),
    ('H', "0011"),
    ('V', "010"),
    ('R', "011"),
    ('A', "1")
  ]

-- Funciones Auxiliares

{-
  Funcion: concatena
  Descripcion: Concatena todas las listas del primer argumento en una sola.
  Uso: concatena [[1], [2, 3], [4, 5]] = [1, 2, 3, 4, 5]
-}
concatena :: [[a]] -> [a]
concatena [] = []
concatena listas = [x | l <- listas, x <- l]

{-
  Funcion: contiene
  Descripcion: Verifica si una lista contiene al elemento especificado.
  Uso: contiene [1, 2, 3, 4, 5] 4 = True
-}
contiene :: (Eq a) => [a] -> a -> Bool
contiene [] _ = False
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
