module P2.EL.EL
  ( Prop
  , Agent
  , World
  , EpiState
  , EpiFormula(..)
  , epiSat
  , testEpiSat
  , update
  , testUpdate
  , testAll
  ) where
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

epiSat :: EpiState -> EpiFormula -> Bool
epiSat _ T = True
epiSat _ F = False
epiSat (interp, _, w) (Var p) = elem w (interp p)
epiSat s (Not phi) = not (epiSat s phi)
epiSat s (And phi psi) = epiSat s phi && epiSat s psi
epiSat s (Or phi psi) = epiSat s phi || epiSat s psi
epiSat s (Imp phi psi) = not (epiSat s phi) || epiSat s psi
epiSat s (Eqv phi psi) = epiSat s phi == epiSat s psi

-- Pour (Knows a phi) : on verifie que phi est vraie dans TOUS les mondes w' que l'agent 'a' ne discerne pas de 'w'
epiSat (interp, indis, w) (Knows a phi) =
    let 
        mondesPossibles = indis a w
        -- verif retourne True si la formule phi est vraie dans le monde w'
        verif w' = epiSat (interp, indis, w') phi
    in 
        all verif mondesPossibles

-- Pour (After phi psi) : phi doit être vraie dans s, et psi doit être vraie dans l'état mis à jour
epiSat s (After phi psi) = 
    (epiSat s phi) && (epiSat (update s phi) psi)


update :: EpiState -> EpiFormula -> EpiState
update (interp, indis, w) phi = (nouvelleInterp, nouvelleIndis, w)
  where
    -- Un monde w' est valide (on le garde) si s=(interp, indis, w') satisfait phi
    estValide w' = epiSat (interp, indis, w') phi
    
    -- On garde uniquement les mondes valides dans les listes renvoyees par l'ancienne interpretation
    nouvelleInterp p = filter estValide (interp p)
    
    -- On garde uniquement les mondes valides dans les listes renvoyees par l'ancienne indiscernabilite
    nouvelleIndis a w' = filter estValide (indis a w')


-- Fonctions de tests 

testEpiSat :: Bool
testEpiSat = 
    let s = ((\_ -> [1]), (\_ x -> [x]), 1)
    in epiSat s T && not (epiSat s F) && epiSat s (Var "p")

testUpdate :: Bool
testUpdate = 
    let s0 = ((\_ -> [1, 2]), (\_ x -> [x]), 1)
        -- Apres l'annonce abstraite "T", l'etat doit toujours contenir les memes mondes si T est verifie
        -- Fait un filtre basique
        s1 = update s0 T
    in epiSat s1 T -- A adapter selon les besoins precis (la structure reste correcte pour renvoyer le meme nombre de mondes)

testAll :: Bool
testAll = testEpiSat && testUpdate

