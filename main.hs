import Epreuve.Epreuve
import ChallengeN.ChaN



main :: IO ()
main = do
    -- Affichage du challenge 1 pour vérification visuelle [cite: 47]
    putStrLn "Formule du Challenge 1 :"
    print cha1
    
    putStrLn "\nMondes satisfaisant le Challenge 1 :"
    print (findWorlds cha1)

    putStrLn "Formule du Challenge 2 :"
    print cha2
    
    putStrLn "\nMondes satisfaisant le Challenge 2 :"
    print (findWorlds cha2)

    putStrLn "Formule du Challenge 3 :"
    print cha3
    
    putStrLn "\nMondes satisfaisant le Challenge 3 :"
    print (findWorlds cha3)
    
    putStrLn ""
    testAll