module Natural where

data Natural = Cero | S Natural deriving (Eq, Show)

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
    Funcion: potencia
    Descripcion: Eleva el primer natural a la potencia del segundo.
    Uso: potencia (S (S (S Cero))) (S (S Cero)) = (S (S (S (S (S (S (S (S (S Cero))))))))))))
-}
potencia :: Natural -> Natural -> Natural
potencia Cero Cero = error "No puedes elevar Cero a la Cero!"
potencia Cero (S n) = Cero
potencia (S n) Cero = S Cero
potencia (S n) (S Cero) = S n
potencia (S n) (S m) = multiplica_nat (S n) (potencia (S n) m)

{-
    Funcion: facNat
    Descripcion: Calcula el factorial de un natural.
    Uso: facNat (S (S (S Cero))) = S (S (S (S (S (S Cero)))))
-}
facNat :: Natural -> Natural
facNat Cero = S Cero
facNat (S n) = multiplica_nat (S n) (facNat n)
