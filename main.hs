import Epreuve.Epreuve
import ChallengeN.ChaN



main :: IO ()
main = do
    -- Affichage du challenge 1 pour vérification visuelle [cite: 47]
    putStrLn "Formule du Challenge 1 :"
    print challenge1
    
    putStrLn "\nMondes satisfaisant le Challenge 1 :"
    print (findWorlds challenge1)
    
    putStrLn ""
    testAll