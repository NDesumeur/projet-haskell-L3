module ChallengeN.Cha5 where
import Epreuve.Epreuve


-- L'affiche 1 : "Un tigre dans une des deux cellules"
door1_5 :: Formula
door1_5 = Or (Var "t1") (Var "t2")

-- L'affiche 2 : "Le tigre est dans l'autre cellule"
door2_5 :: Formula
door2_5 = (Var "t1")

reglement5 :: Formula
reglement5 = And
    (And (Imp (Var "p1") (T)) (Imp (Var "t1") (F))) -- La 1 est vraie ET la 2 est vraie
    (And (Imp (Var "p2") (F)) (Imp (Var "t2") (T))) -- La 1 est fausse ET la 2 est fausse

cha5 :: Formula
cha5 = And constraint reglement5