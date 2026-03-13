module CPL.ChallengeN.Cha6 where
import CPL.Epreuve.Epreuve


constraint2 :: Formula
constraint2 = And(And 
    (Not (And (Var "p1") (Var "t1"))) -- Pas p1 ET t1
    (Not (And (Var "p2") (Var "t2")))) -- Pas p2 ET t2
    ((Not (And (Var "p3") (Var "t3")))) -- Pas p3 ET t3

constraint3 :: Formula
constraint3 = And 
    (Not (And (Var "p2") (Var "p3"))) -- Pas p2 ET p3 dans la même formule
    (And (Not (And (Var "p1") (Var "p2"))) -- Pas p1 ET p2 dans la même formule
    (Not (And (Var "p1") (Var "p3")))) -- Pas p1 ET p3 dans la même formule

-- L'affiche 1 : "Un tigre ici"
door1_6 :: Formula
door1_6 = (Var "t1")

-- L'affiche 2 : "Cette cellule contient une peluche"
door2_6 :: Formula
door2_6 = (Var "p2")

-- L'affiche 3 : "Le tigre est dans la cellule 2"
door3_6 :: Formula
door3_6 = (Var "t2")

-- La porte 1 dit vrai
reglement1_6 :: Formula
reglement1_6 = And (And (Not (door2_6)) (Not (door3_6))) (door1_6)

-- La porte 2 dit vrai
reglement2_6 :: Formula
reglement2_6 = And (And (Not (door1_6)) (Not (door3_6))) (door2_6)

-- La porte 3 dit vrai
reglement3_6 :: Formula
reglement3_6 = And (And (Not (door1_6)) (Not (door2_6))) (door3_6)


-- Seulement une des trois portes dit vrai
reglement6 :: Formula
reglement6 = Or
    (Or (reglement1_6) (reglement2_6))
    (reglement3_6)


cha6 :: Formula
cha6 = And (And constraint2 constraint3) (reglement6)