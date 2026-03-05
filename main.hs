import Epreuve.Epreuve
import ChallengeN.ChaN

-- Tests pour genAllWorlds [cite: 143]
testGenAllWorlds :: [Bool]
testGenAllWorlds = 
    [ length (genAllWorlds ["p1", "p2"]) == 4                 -- 2^2 mondes possibles [cite: 68]
    , length (genAllWorlds ["p1", "p2", "t1", "t2"]) == 16    -- 2^4 mondes possibles [cite: 71]
    , [] `elem` genAllWorlds ["p1"]                           -- Le monde vide est inclus [cite: 68]
    ]

-- Tests pour sat [cite: 143]
testSat :: [Bool]
testSat = 
    [ sat ["p1"] (Var "p1") == True                           -- [cite: 77]
    , sat ["p2"] (Var "p1") == False                          -- [cite: 77]
    , sat ["p1", "t2"] (And (Var "p1") (Var "t2")) == True    -- [cite: 79]
    , sat ["p1"] (Not (Var "p1")) == False                    -- La négation [cite: 40]
    , sat ["p1", "t1"] (Imp (Var "p1") (Var "t1")) == True              -- F -> F est Vrai             
    ]

-- Tests pour findWorlds [cite: 144]
testFindWorlds :: [Bool]
testFindWorlds = 
    -- La formule (p1) dans l'univers {p1} ne doit retourner qu'un seul monde
    [ length (findWorlds (Var "p1")) == 1
    -- Vérification sur une formule connue
    , not (null (findWorlds challenge1))
    ]


-- Fonction utilitaire pour vérifier un groupe de tests (comme dans exo.hs)
test :: [Bool] -> Bool
test [] = False
test [x] = x
test (x:xs) = x && test xs 

-- Exécution globale des tests [cite: 145]
testAll :: IO ()
testAll = do
    putStrLn "--- Exécution des tests du Projet ---"
    
    -- On calcule les résultats individuellement 
    let resGen  = test testGenAllWorlds
    let resSat  = test testSat
    let resFind = test testFindWorlds
    
    -- Affichage simple ligne par ligne
    putStrLn ("genAllWorlds : " ++ (if resGen  then "OK" else "ERREUR"))
    putStrLn ("sat          : " ++ (if resSat  then "OK" else "ERREUR"))
    putStrLn ("findWorlds   : " ++ (if resFind then "OK" else "ERREUR"))
    
    -- Conclusion [cite: 145]
    if resGen && resSat && resFind
        then putStrLn "\nFélicitations : Tous les tests ont réussi !" 
        else putStrLn "\nAttention : Certains tests ont échoué."

main :: IO ()
main = do
    -- Affichage du challenge 1 pour vérification visuelle [cite: 47]
    putStrLn "Formule du Challenge 1 :"
    print challenge1
    
    putStrLn "\nMondes satisfaisant le Challenge 1 :"
    print (findWorlds challenge1)
    
    putStrLn ""
    testAll