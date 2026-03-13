module CPL.Epreuve.Sat where
import CPL.Epreuve.Formula
import CPL.Epreuve.World


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



-- Tests pour sat
testSat :: [Bool]
testSat = 
    [ sat ["p1"] (Var "p1") == True                          
    , sat ["p2"] (Var "p1") == False                         
    , sat ["p1", "t2"] (And (Var "p1") (Var "t2")) == True   
    , sat ["p1"] (Not (Var "p1")) == False                    -- La négation 
    , sat ["p1", "t1"] (Imp (Var "p1") (Var "t1")) == True              -- F -> F est Vrai             
    ]
