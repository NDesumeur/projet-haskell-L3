module Epreuve.Formula where

data Formula = T          -- Vrai
             | F          -- Faux
             | Var String -- Variable propositionnelle (ex: Var "p1")
             | Not (Formula) -- Négation
             | And (Formula) (Formula) -- Conjonction
             | Or (Formula) (Formula)   -- Disjonction
             | Imp (Formula) (Formula) -- Implication
             | Eqv (Formula) (Formula) -- Équivalence

--Redefinition de Show poue un affichage plus personnalise
instance Show Formula where
  show T = "True"
  show F = "False"
  show (Var s) = s
  show (Not phi) = "¬" ++ show phi
  show (And phi psi) = "(" ++ show phi ++ " ∧ " ++ show psi ++ ")"
  show (Or phi psi) = "(" ++ show phi ++ " ∨ " ++ show psi ++ ")"
  show (Imp phi psi) = "(" ++ show phi ++ " → " ++ show psi ++ ")"
  show (Eqv phi psi) = "(" ++ show phi ++ " ↔ " ++ show psi ++ ")"

-- Contrainte : Pour chaque cellule, on ne peut pas avoir p et t en même temps.
-- On définit cela pour la cellule 1 et la cellule 2.
constraint :: Formula
constraint = And 
    (Not (And (Var "p1") (Var "t1"))) -- Pas p1 ET t1
    (Not (And (Var "p2") (Var "t2"))) -- Pas p2 ET t2

-- L'affiche 1 : "p1 AND t2"
door1 :: Formula
door1 = And (Var "p1") (Var "t2")

-- L'affiche 2 : "Une peluche dans UNE cellule et un tigre dans UNE cellule"
-- Traduction : (p1 AND t2) OR (t1 AND p2)
door2 :: Formula
door2 = Or (And (Var "p1") (Var "t2")) (And (Var "t1") (Var "p2"))

reglement :: Formula
reglement = Or 
    (And door1 (Not door2)) -- La 1 est vraie ET la 2 est fausse
    (And (Not door1) door2) -- La 1 est fausse ET la 2 est vraie



--representer le challenge 1
challenge1 :: Formula
challenge1 = And constraint reglement