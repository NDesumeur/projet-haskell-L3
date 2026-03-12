module Projet.Epreuve.FindWorlds where
import Projet.Epreuve.Formula
import Projet.Epreuve.World
import Projet.Epreuve.Sat
import Projet.Epreuve.GenAllWorlds


-- Extraie la variable d'une formule pour générer les mondes possibles
extract:: Formula -> World
extract T = []
extract F = []
extract (Var s) = [s]
extract (Not f) = extract f
extract (And a b) = extract a ++ extract b
extract (Or a b) = extract a ++ extract b
extract (Imp a b) = extract a ++ extract b
extract (Eqv a b) = extract a ++ extract b      


-- Supprime les doublons d'une liste de string pour ne pas générer des mondes en double
supprimeDoublons :: [String] -> [String]
supprimeDoublons [] = []
supprimeDoublons (x:xs) 
    | x `elem` xs = supprimeDoublons xs
    | otherwise   = x : supprimeDoublons xs


-- Trouver tous les mondes qui satisfont une formule
findWorlds :: Formula -> [World]
findWorlds phi = 
    let toutesLesVars = extract phi
        varsUniques   = supprimeDoublons toutesLesVars
        mondes        = genAllWorlds varsUniques
    in [ w | w <- mondes, sat w phi ]


-- Tests pour findWorlds 
testFindWorlds :: [Bool]
testFindWorlds = 
    -- La formule (p1) dans l'univers {p1} ne doit retourner qu'un seul monde
    [ length (findWorlds (Var "p1")) == 1
    -- Vérification sur une formule connue
    , not (null (findWorlds challenge1))
    ]
