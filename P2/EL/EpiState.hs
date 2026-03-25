module P2.EL.EpiState where

type Prop = String  -- Type Prop (verite sale ou propre)
type Agent = String  -- Type Agent (personne) 
type World = Int   -- Type world (representation binaire 0 pour propre et 1 pour sale) 

type EpiState = (Prop -> [World], Agent -> World -> [World], World) -- Pour representer une situation