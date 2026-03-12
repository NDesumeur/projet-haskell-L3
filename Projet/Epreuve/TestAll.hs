module Projet.Epreuve.TestAll where
import Projet.Epreuve.Formula
import Projet.Epreuve.World
import Projet.Epreuve.Sat
import Projet.Epreuve.GenAllWorlds
import Projet.Epreuve.FindWorlds



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
