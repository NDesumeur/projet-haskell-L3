module Projet.Epreuve.GenAllWorlds where
import Projet.Epreuve.Formula
import Projet.Epreuve.World


-- Générer tous les mondes possibles d'un ensemble donné
genAllWorlds::World-> [World]
genAllWorlds [] = [[]]
genAllWorlds (x:xs) = let other= genAllWorlds xs in other ++ map (x:) other

-- Tests pour genAllWorlds [cite: 143]
testGenAllWorlds :: [Bool]
testGenAllWorlds = 
    [ length (genAllWorlds ["p1", "p2"]) == 4                 -- 2^2 mondes possibles [cite: 68]
    , length (genAllWorlds ["p1", "p2", "t1", "t2"]) == 16    -- 2^4 mondes possibles [cite: 71]
    , [] `elem` genAllWorlds ["p1"]                           -- Le monde vide est inclus [cite: 68]
    ]