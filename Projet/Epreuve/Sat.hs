module Projet.Epreuve.Sat where
import Projet.Epreuve.Formula
import Projet.Epreuve.World


-- Fonction sat pour vérifier si un monde satisfait une propriété
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



-- Tests pour sat [cite: 143]
testSat :: [Bool]
testSat = 
    [ sat ["p1"] (Var "p1") == True                           -- [cite: 77]
    , sat ["p2"] (Var "p1") == False                          -- [cite: 77]
    , sat ["p1", "t2"] (And (Var "p1") (Var "t2")) == True    -- [cite: 79]
    , sat ["p1"] (Not (Var "p1")) == False                    -- La négation [cite: 40]
    , sat ["p1", "t1"] (Imp (Var "p1") (Var "t1")) == True              -- F -> F est Vrai             
    ]
