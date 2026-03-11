module ChallengeN.Cha2 where
import Epreuve.Epreuve


-- L'affiche 1 : "Une pelluche dans une des deux cellules"
door1_2 :: Formula
door1_2 = Or (Var "p1") (Var "p2")

-- L'affiche 2 : "Le tigre est dans l'autre cellule"
door2_2 :: Formula
door2_2 = (Var "t1")

reglement2 :: Formula
reglement2 = Or 
    (And door1_2 door2_2) -- La 1 est vraie ET la 2 est vraie
    (And (Not door1_2) (Not door2_2)) -- La 1 est fausse ET la 2 est fausse

cha2 :: Formula
cha2 = And constraint reglement2