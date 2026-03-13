module CPL.ChallengeN.Cha3 where
import CPL.Epreuve.Epreuve


-- L'affiche 1 : "Un tigre est dans cette cellule et une peluche dans l'autre "
door1_3 :: Formula
door1_3 = Or (Var "t1") (Var "p2")

-- L'affiche 2 : "Une peluche est dans l'autre cellule"
door2_3 :: Formula
door2_3 = (Var "p1")

reglement3 :: Formula
reglement3 = Or 
    (And door1_3 door2_3) -- La 1 est vraie ET la 2 est vraie
    (And (Not door1_3) (Not door2_3)) -- La 1 est fausse ET la 2 est fausse

cha3 :: Formula
cha3 = And constraint reglement3
