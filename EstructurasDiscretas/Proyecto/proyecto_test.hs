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
testObtenerFrecuencias :: Test
testObtenerFrecuencias =
  "obtenerFrecuencias"
    ~: TestList
      [ "Correct count of letters for word" ~: ejemploFrecuencias ~=? obtenerFrecuencias "AVRAHKADABRA"
      ]

-- Test for ordenarFrecuencias
testOrdenarFrecuencias :: Test
testOrdenarFrecuencias =
  "ordenarFrecuencias"
    ~: TestList
      [ "Correct order of initial frequencies list" ~: [('c', 0), ('b', 1), ('d', 2), ('a', 4)] ~=? ordenarFrecuencias [('a', 4), ('b', 1), ('c', 0), ('d', 2)]
      ]

-- Test for construyeArbol
testConstruyeArbol :: Test
testConstruyeArbol =
  "construyeArbol"
    ~: TestList
      [ "Correct three built according to docs" ~: ejemploArbol ~=? construyeArbol "AVRAHKADABRA"
      ]

-- Test for construye
testConstruye :: Test
testConstruye =
  "construye"
    ~: TestList
      [ "Correct behavior of function to build tree" ~: ejemploConstruye ~=? construye (obtenerHojas (obtenerFrecuencias "AVRAHKADABRA")) []
      ]

-- Test for deriving Eq behavior and linting with HUnit in VSCode
testArbolEquality :: Test
testArbolEquality =
  "arbolEquality"
    ~: TestList
      [ "Trees should be equal" ~: Hoja 'a' 1 ~=? Hoja 'a' 1
      ]

-- Test for tamanioPromedio
testTamanioPromedio :: Test
testTamanioPromedio =
  "tamanioPromedio"
    ~: TestList
      [ "Correct average size" ~: 2.5 ~=? tamanioPromedio ejemploPalabra
      ]

-- Test for CaminosCodificados
testCaminosCodificados :: Test
testCaminosCodificados =
  "caminosCodificados"
    ~: TestList
      [ "Correct result of paths" ~: ejemploCaminos ~=? caminosCodificados ejemploArbol ""
      ]

-- Test for codifica
testCodifica :: Test
testCodifica = 
  "codifica"
    ~: TestList
      [ "Correct result of encoding" ~: ejemploPalabraCodificada ~=? codifica ejemploArbol ejemploPalabra
      ]

-- Test for sumaPonderada
testSumaPonderada :: Test
testSumaPonderada =
  "sumaPonderada"
    ~: TestList
      [ "Correct weight sum" ~: 1.0 ~=? sumaPonderada [('a', 1)] [('a', "1")] 1,
        "Correct weight sum" ~: (30 / 12) ~=? sumaPonderada ejemploFrecuencias ejemploCaminos 12
      ]

-- Test for decodificaRepresentacion
testDecodifica :: Test
testDecodifica =
  "testDecodifica"
    ~: TestList
      [ "Correct decoding of single letter A" ~: "A" ~=? decodifica ejemploArbol "1",
        "Correct decoding of single letter V" ~: "V" ~=? decodifica ejemploArbol "010",
        "Correct decoding of single letter R" ~: "R" ~=? decodifica ejemploArbol "011",
        "Correct decoding of single letter H" ~: "H" ~=? decodifica ejemploArbol "0011",
        "Correct decoding of single letter K" ~: "K" ~=? decodifica ejemploArbol "0010",
        "Correct decoding of single letter D" ~: "D" ~=? decodifica ejemploArbol "0001",
        "Correct decoding of single letter B" ~: "B" ~=? decodifica ejemploArbol "0000",
        "Correct decoding of two letters AV" ~: "AV" ~=? decodifica ejemploArbol "1010",
        "Correct decoding of the string" ~: ejemploPalabra ~=? decodifica ejemploArbol ejemploPalabraCodificada
      ]

main :: IO Counts
main =
  runTestTT $
    TestList
      [ testConcatenaListas,
        testContiene,
        testUnicos,
        testCuenta,
        testObtenerFrecuencias,
        testOrdenarFrecuencias,
        testConstruyeArbol,
        testConstruye,
        testArbolEquality,
        testTamanioPromedio,
        testCaminosCodificados,
        testCodifica,
        testSumaPonderada,
        testDecodifica
      ]
