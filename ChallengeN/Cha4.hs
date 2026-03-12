module ChallengeN.Cha4 where
import Epreuve.Epreuve


-- L'affiche 1 : "Une peluche dans les deux cellules"
door1_4 :: Formula
door1_4 = And (Var "p1") (Var "p2")

-- L'affiche 2 : "Il y a une peluche dans l'autre cellule"
door2_4 :: Formula
door2_4 = (Var "p1")

reglement4 :: Formula
reglement4 = And
    (And (Imp (Var "p1") (T)) (Imp (Var "t1") (F))) -- La 1 est vraie ET la 2 est vraie
    (And (Imp (Var "p2") (F)) (Imp (Var "t2") (T))) -- La 1 est fausse ET la 2 est fausse

cha4 :: Formula
cha4 = And constraint reglement4