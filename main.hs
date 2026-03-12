import Projet.ModuleGlobal



main :: IO ()
main = do
    -- Affichage du challenge 1 pour vérification visuelle [cite: 47]
    putStrLn "Formule du Challenge 1 :"
    print cha1
    
    putStrLn "\nMondes satisfaisant le Challenge 1 :"
    print (findWorlds cha1)

    putStrLn "\nFormule du Challenge 2 :"
    print cha2
    
    putStrLn "\nMondes satisfaisant le Challenge 2 :"
    print (findWorlds cha2)

    putStrLn "\nFormule du Challenge 3 :"
    print cha3
    
    putStrLn "\nMondes satisfaisant le Challenge 3 :"
    print (findWorlds cha3)

    putStrLn "\nFormule du Challenge 4 :"
    print cha4
    
    putStrLn "\nMondes satisfaisant le Challenge 4 :"
    print (findWorlds cha4)

    putStrLn "\nFormule du Challenge 5 :"
    print cha5
    
    putStrLn "\nMondes satisfaisant le Challenge 5 :"
    print (findWorlds cha5)

    putStrLn "\nFormule du Challenge 6 :"
    print cha6
    
    putStrLn "\nMondes satisfaisant le Challenge 6 :"
    print (findWorlds cha6)

    putStrLn ""
    testAll