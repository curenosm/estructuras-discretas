data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{-
    Funcion:
    Descripcion:
    Uso: mayorIgual (Cont (Cont Mati)) Mati = True
-}
mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati Mati = True
mayorIgual _ Mati = True
mayorIgual Mati _ = False
mayorIgual (Cont m) (Cont n) = mayorIgual m n

{-
    Funcion:
    Descripcion:
    Uso: aplana (Cont (Cont Mati)) = [Cont (Cont Mati), Cont Mati, Mati]
-}
aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = Cont m : aplana m
