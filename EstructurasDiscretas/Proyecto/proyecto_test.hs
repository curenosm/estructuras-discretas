-- proyecto_test.hs
-- To compile and run: runhaskell proyecto_test.hs

import Auxiliar
import Proyecto
import Test.HUnit

-- Test concatenaListas
testConcatenaListas :: Test
testConcatenaListas =
  "concatenaListas"
    ~: TestList
      [ "Concatenate correctly several lists" ~: [0, 1, 2, 3, 4, 5, 6, 7] ~=? concatena [[0, 1, 2], [3, 4, 5], [6, 7]]
      ]

-- Test for contiene
testContiene :: Test
testContiene =
  "contiene"
    ~: TestList
      [ "Element is present in sequence" ~: True ~=? contiene [9, 8, 7, 6, 5, 1] 1
      ]

-- Test for unicos
testUnicos :: Test
testUnicos =
  "unicos"
    ~: TestList
      [ "Correct count of unique elements for a list" ~: [1, 3, 4, 5, 2] ~=? unicos [1, 1, 3, 4, 5, 2, 2]
      ]

-- Test for cuenta
testCuenta :: Test
testCuenta =
  "cuenta"
    ~: TestList
      [ "Correct count of elements for a list" ~: 3 ~=? cuenta [1, 2, 3, 4, 1, 5, 6, 7, 1, 8, 9] 1
      ]

-- Test for obtenerFrecuencias

-- Test for ordenarFrecuencias

-- Test for construyeArbol

-- Test for construye

-- Test for deriving Eq behavior and linting with HUnit in VSCode
testArbolEquality :: Test
testArbolEquality =
  "arbolEquality"
    ~: TestList
      [ "Trees should be equal" ~: Hoja 'a' 1 ~=? Hoja 'a' 1
      ]

-- Test for tamanioPromedio

-- Test for CaminosCodificados

-- Test for sumaPonderada
testSumaPonderada :: Test
testSumaPonderada =
  "sumaPonderada"
    ~: TestList
      [ "Correct weight sum" ~: 1.0 ~=? sumaPonderada [('a', 1)] [('a', "1")] 1,
        "Correct weight sum" ~: (30 / 12) ~=? sumaPonderada ejemploFrecuencias ejemploCaminos 12
      ]

-- Test for decodificaRepresentacion

main :: IO Counts
main =
  runTestTT $
    TestList []
