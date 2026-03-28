module P2.EL.EL where
-- EL contient tous les types 
type Agent = String  -- Type Agent (personne) 
type Prop = String  -- Type Prop (verite sale ou propre)
type World = Int   -- Type world (representation binaire 0 pour propre et 1 pour sale) 
type EpiState = (Prop -> [World], Agent -> World -> [World], World) -- Pour representer une situation
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
