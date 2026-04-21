module Practica6 where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

data Recorrido = PreOrden | InOrden | PosOrden

{-
    Función: nVacios
    Descripción: Devuelve el número de nodos vacíos en el árbol.
    Uso: nVacios (AB 1 (AB 0 Vacio Vacio) (AB 2 Vacio Vacio)) = 4
-}
nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB r i d) = nVacios i + nVacios d

{-
    Función: refleja
    Descripción: Refleja un arbol binario.
    Uso: refleja (AB 1 (AB 0 Vacio Vacio) (AB 2 Vacio Vacio)) =
        refleja (AB 1 (AB 2 Vacio Vacio) (AB 0 Vacio Vacio))
-}
refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB r i d) = AB r (refleja d) (refleja i)

{-
    Función: minimo
    Descripción: Obtiene el elemento con el menor valor en el árbol.
    Uso: minimo (AB 1 (AB 0 Vacio Vacio) (AB 2 Vacio Vacio)) = 0
-}
minimo :: Arbol Int -> Int
minimo Vacio = maxBound
minimo (AB r i d)
  | r < min_i && r < min_d = r
  | min_i < min_d = min_i
  | min_d < min_i = min_d
  | otherwise = 0
  where
    min_i = minimo i
    min_d = minimo d

{-
    Función: recorrido
    Descripción: Recorre un árbol binario usando un tipo de recorrido dado.
    Uso: recorrido (AB 1 (AB 0 Vacio Vacio) (AB 2 Vacio Vacio)) PreOrden = [0, 1, 2]
-}
recorrido :: (Eq a) => Arbol a -> Recorrido -> [a]
recorrido Vacio _ = []
recorrido (AB r i d) tipo = case tipo of
  PreOrden -> [r] ++ recorrido i tipo ++ recorrido d tipo
  InOrden -> recorrido i tipo ++ [r] ++ recorrido d tipo
  PosOrden -> recorrido i tipo ++ recorrido d tipo ++ [r]

{-
    Función: esBalanceado
    Descripción: Nos indica si el árbol binario está bien balanceado.
    Uso: esBalanceado (AB 1 (AB 0 Vacio Vacio) (AB 2 Vacio Vacio)) = True
-}
esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB r i d) =
  let diferenciaAlturas = altura i - altura d
   in -1 <= diferenciaAlturas && diferenciaAlturas <= 1 && esBalanceado i && esBalanceado d
  where
    altura :: Arbol a -> Int
    altura Vacio = 0
    altura (AB r i d) =
      let altura_i = altura i
          altura_d = altura d
       in 1 + if altura_i > altura_d then altura_i else altura_d

{-
    Función: listaArbol
    Descripción: Forma un árbol binario de busqueda (no necesariamente bien
        balanceado) utilizando los elementos provistos en la lista.
    Uso: listaArbol [5, 3, 7, 1, 9] =
        AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
-}
listaArbol :: (Ord a) => [a] -> Arbol a
listaArbol [] = Vacio
listaArbol (x : xs) = inserta xs (AB x Vacio Vacio)
  where
    inserta :: (Ord a) => [a] -> Arbol a -> Arbol a
    inserta [] arbol = arbol
    inserta (x : xs) Vacio = AB x Vacio Vacio
    inserta (x : xs) (AB r i d)
      | x < r = inserta xs (AB r (inserta [x] i) d)
      | x > r = inserta xs (AB r i (inserta [x] d))
      | otherwise = inserta xs (AB r i d)
