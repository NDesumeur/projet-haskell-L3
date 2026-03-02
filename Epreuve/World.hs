module Epreuve.World where
import Epreuve.Formula

type World = [String] --type world 


--Generation du momde 0
w0::World
w0 = ["p1" , "p2"]

--Generation du momde 1
w1::World
w1 = ["t1" , "t2"]

--Generation du momde 2
w2::World
w2 = ["p1" , "p2","t1" , "t2"]


--Generer tous les mondes possibles d'unn ensemble donne
genAllWorlds::World-> [World]
genAllWorlds [] = [[]]
genAllWorlds (x:xs) = let other= genAllWorlds xs in other ++ map (x:) other


--Fonction sat pour verifier si un monde satisfait une propriete
sat :: World -> Formula -> Bool
sat [] _ = False
sat _ T = True
sat _ F = False
sat (x:xs) (Var s)
    | x==s = True
    | otherwise = sat xs (Var s)
sat w (Not f) = not (sat w f)
sat w (And a b) = sat w a && sat w b
sat w (Or a b) = sat w a || sat w b
sat w (Imp a b) = not (sat w a) || sat w b
sat w (Eqv a b) = sat w a == sat w b



--extrait la variable d'une formule pour generer les mondes possibles
extract:: Formula -> World
extract T = []
extract F = []
extract (Var s) = [s]
extract (Not f) = extract f
extract (And a b) = extract a ++ extract b
extract (Or a b) = extract a ++ extract b
extract (Imp a b) = extract a ++ extract b
extract (Eqv a b) = extract a ++ extract b      


--supprime les doublons d'une liste de string pour ne pas generer des mondes en double
supprimeDoublons :: [String] -> [String]
supprimeDoublons [] = []
supprimeDoublons (x:xs) 
    | x `elem` xs = supprimeDoublons xs
    | otherwise   = x : supprimeDoublons xs


--Trouver tous les mondes qui satisfont une formule
findWorlds :: Formula -> [World]
findWorlds phi = 
    let toutesLesVars = extract phi
        varsUniques   = supprimeDoublons toutesLesVars
        mondes        = genAllWorlds varsUniques
    in [ w | w <- mondes, sat w phi ]