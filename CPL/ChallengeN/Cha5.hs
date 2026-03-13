module CPL.ChallengeN.Cha5 where
import CPL.Epreuve.Epreuve


-- L'affiche 1 : "Choisis bien ta cellule"
door1_5 :: Formula
door1_5 = Not (Eqv (Var "p1") (Var "p2"))

-- L'affiche 2 : "Tu ferais mieux de choisir l'autre cellule"
door2_5 :: Formula
door2_5 = (Var "t2")

reglement5 :: Formula
reglement5 = And
    (And (Imp (Var "p1") (T)) (Imp (Var "t1") (F))) -- La 1 est vrai si et seulement si un peluche s'y trouve, inversement sinon
    (And (Imp (Var "p2") (F)) (Imp (Var "t2") (T))) -- La 2 est vrai si et seulement si un tigre s'y trouve, inversement sinon

cha5 :: Formula
cha5 = And constraint reglement5