module CPL.Epreuve.TestAll where
import CPL.Epreuve.Formula
import CPL.Epreuve.World
import CPL.Epreuve.Sat
import CPL.Epreuve.GenAllWorlds
import CPL.Epreuve.FindWorlds



-- Fonction utilitaire pour vérifier un groupe de tests (comme dans exo.hs)
test :: [Bool] -> Bool
test [] = False
test [x] = x
test (x:xs) = x && test xs 

-- Exécution globale des tests 
testAll :: IO ()
testAll = do
    putStrLn "--- Exécution des tests du CPL ---"
    
    -- On calcule les résultats individuellement 
    let resGen  = test testGenAllWorlds
    let resSat  = test testSat
    let resFind = test testFindWorlds
    
    -- Affichage simple ligne par ligne
    putStrLn ("genAllWorlds : " ++ (if resGen  then "OK" else "ERREUR"))
    putStrLn ("sat          : " ++ (if resSat  then "OK" else "ERREUR"))
    putStrLn ("findWorlds   : " ++ (if resFind then "OK" else "ERREUR"))
    
    -- Conclusion 
    if resGen && resSat && resFind
        then putStrLn "\nFélicitations : Tous les tests ont réussi !" 
        else putStrLn "\nAttention : Certains tests ont échoué."
