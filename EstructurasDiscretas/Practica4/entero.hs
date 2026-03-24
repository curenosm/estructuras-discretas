data Entero = Zero | Succ Entero | Neg Entero deriving (Eq, Show)

{-
    Funcion: multiEnt
    Descripcion: Multiplica dos enteros.
    Uso: suma_ent (Neg (Succ (Succ Zero))) (Neg (Succ (Succ Zero))) = (Neg (Succ (Succ (Succ (Succ  Zero)))))
-}
suma_ent :: Entero -> Entero -> Entero
-- Casos Base (Identidad)
suma_ent Zero m = m
suma_ent n Zero = n

-- Casos Recursivos
suma_ent (Succ n) (Succ m) = Succ (suma_ent n (Succ m))
suma_ent (Neg n) (Neg m) = Neg (suma_ent n m)
suma_ent (Succ n) (Neg m) = resta_ent (Succ n) m
suma_ent (Neg n) (Succ m) = resta_ent (Succ m) n

{-
    Funcion: resta_ent
    Descripcion: Resta dos enteros.
    Uso: resta_ent (Neg (Succ (Succ Zero))) (Neg (Succ (Succ Zero))) = (Neg (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))
-}
resta_ent :: Entero -> Entero -> Entero
-- Casos Base
resta_ent n Zero = n
resta_ent Zero (Succ m) = Neg (Succ m)
resta_ent Zero (Neg m) = Succ m

-- Casos Recursivos
resta_ent (Succ n) (Succ m) = resta_ent n m
resta_ent (Neg n) (Neg m) = resta_ent m n
resta_ent n (Neg m) = suma_ent n (Succ m)

{-
    Funcion: multiEnt
    Descripcion: Multiplica dos enteros.
    Uso: multiEnt (Neg (Succ (Succ Zero))) (Neg (Succ (Succ Zero))) = (Neg (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))
-}
-- Casos Base
multiEnt :: Entero -> Entero -> Entero
multiEnt Zero _ = Zero
multiEnt _ Zero = Zero
multiEnt (Succ Zero) n = n
multiEnt n (Succ Zero) = n
multiEnt (Neg (Succ Zero)) (Succ n) = Neg (Succ n)
multiEnt (Succ n) (Neg (Succ Zero)) = Neg (Succ n)

-- Casos Recursivos
multiEnt (Neg n) (Succ m) = Neg (suma_ent n (multiEnt n m))
multiEnt (Succ n) (Neg (Succ m)) = Neg (suma_ent (Succ n) (multiEnt (Succ n) m))
multiEnt (Neg (Succ n)) (Neg (Succ m)) = suma_ent (Succ n) (multiEnt (Succ n) m)
multiEnt (Succ n) (Succ m) = suma_ent (Succ n) (multiEnt (Succ n) m)

-- Casos exhaustivos (multiple negacion)
multiEnt (Neg (Neg n)) m = multiEnt n m
multiEnt n (Neg (Neg m)) = multiEnt n m
