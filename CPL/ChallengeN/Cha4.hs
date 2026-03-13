module CPL.ChallengeN.Cha4 where
import Projet.Epreuve.Epreuve


-- L'affiche 1 : "Aucune importance sur le choix de la cellule"
door1_4 :: Formula
door1_4 = Eqv (Var "p1") (Var "p2")

-- L'affiche 2 : "Il y a une peluche dans l'autre cellule"
door2_4 :: Formula
door2_4 = (Var "p1")

reglement4 :: Formula
reglement4 = And
    (And (Imp (Var "p1") (T)) (Imp (Var "t1") (F))) -- La 1 est vrai si et seulement si une peluche s'y trouve, inversement sinon
    (And (Imp (Var "p2") (F)) (Imp (Var "t2") (T))) -- La 2 est vrai si et seulement si un tigre s'y trouve, inversement sinon

cha4 :: Formula
cha4 = And constraint reglement4