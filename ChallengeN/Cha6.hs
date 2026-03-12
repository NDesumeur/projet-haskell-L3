module ChallengeN.Cha6 where
import Epreuve.Epreuve


-- L'affiche 1 : "Un tigre dans une des deux cellules"
door1_6 :: Formula
door1_6 = (Var "t1")

-- L'affiche 2 : "Le tigre est dans l'autre cellule"
door2_6 :: Formula
door2_6 = (Var "p2")

-- L'affiche 3 : "Le tigre est dans l'autre cellule"
door3_6 :: Formula
door3_6 = (Var "t2")

reglement1_6 :: Formula
reglement1_6 = And (And (Not (door2_6)) (Not (door3_6))) (door1_6)

reglement2_6 :: Formula
reglement2_6 = And (And (Not (door1_6)) (Not (door3_6))) (door2_6)

reglement3_6 :: Formula
reglement3_6 = And (And (Not (door1_6)) (Not (door2_6))) (door3_6)

reglement6 :: Formula
reglement6 = Or
    (Or (reglement1_6) (reglement2_6))
    (reglement3_6)


cha6 :: Formula
cha6 = And constraint reglement6

-- Cellule 3 ?