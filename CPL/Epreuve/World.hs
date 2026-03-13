module CPL.Epreuve.World where
import CPL.Epreuve.Formula

type World = [String] --type world 


-- Génération du monde 0
w0::World
w0 = ["p1" , "p2"]

-- Génération du monde 1
w1::World
w1 = ["t1" , "t2"]

-- Génération du monde 2
w2::World
w2 = ["p1" , "p2","t1" , "t2"]

-- Génération du monde 3
w3::World
w3 = ["p1","p2","p3","t1","t2","t3"]