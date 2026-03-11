module ChallengeN.Cha4 where
import Epreuve.Epreuve


-- L'affiche 1 : "Une pelluche dans une des deux cellules"
door1_4 :: Formula
door1_4 = And (Var "p1") (Var "p2")

-- L'affiche 2 : "Le tigre est dans l'autre cellule"
door2_4 :: Formula
door2_4 = (Var "p1")

reglement4 :: Formula
reglement4 = Or 
    (And door1_4 door2_4) -- La 1 est vraie ET la 2 est vraie
    (And (Not door1_4) (Not door2_4)) -- La 1 est fausse ET la 2 est fausse

cha4 :: Formula
cha4 = And constraint reglement4