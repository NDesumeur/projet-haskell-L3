module P2.EL.EpiFormula where
import P2.EL.Prop Prop
import P2.EL.Agent Agent

data EpiFormula
	= T                           -- Vrai
	| F                           -- Faux
	| Var Prop                    -- Type Prop 
	| Not EpiFormula              -- Negation
	| And EpiFormula EpiFormula   -- Conjonction
	| Or EpiFormula EpiFormula    -- Disjonction
	| Imp EpiFormula EpiFormula   -- Implication
	| Eqv EpiFormula EpiFormula   -- Equivalence
	| Knows Agent EpiFormula      -- L'agent sait que ...
	| After EpiFormula EpiFormula -- Apres phi, psi 
	deriving (Show)               -- Pour afficher une formule (comme demandé dans l'énoncé)

    -- ex de chaque formule : a = alice, b = bob, as = alice est sale, bs = bob est sale
    -- T : Vrai
    -- F : Faux
    -- Var "as" : Alice est sale
    -- Not (Var "as") : Alice n'est pas sale
    -- And (Var "as") (Var "bs") : Alice et Bob sont sales
    -- Or (Var "as") (Var "bs") : Alice ou Bob est sale
    -- Imp (Var "as") (Var "bs") : Si Alice est sale alors Bob est sale
    -- Eqv (Var "as") (Var "bs") : Alice est sale si et seulement si Bob est sale
    -- Knows "a" (Var "as") : Alice sait qu'elle est sale
	-- After (Or (Var "as") (Var "bs")) (Knows "b" (Var "bs")) : apres l'annonce "au moins un est sale", Bob sait qu'il est sale
