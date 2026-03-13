module CPL.Epreuve.GenAllWorlds where
import CPL.Epreuve.Formula
import CPL.Epreuve.World


-- Générer tous les mondes possibles d'un ensemble donné
genAllWorlds::World-> [World]
genAllWorlds [] = [[]]
genAllWorlds (x:xs) = let other= genAllWorlds xs in other ++ map (x:) other

-- Tests pour genAllWorlds 
testGenAllWorlds :: [Bool]
testGenAllWorlds = 
    [ length (genAllWorlds ["p1", "p2"]) == 4                 -- 2^2 mondes possibles 
    , length (genAllWorlds ["p1", "p2", "t1", "t2"]) == 16    -- 2^4 mondes possibles 
    , [] `elem` genAllWorlds ["p1"]                           -- Le monde vide est inclus 
    ]