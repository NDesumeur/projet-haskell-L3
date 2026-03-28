module Problem3 (problem3, s0) where

import EL

s0 :: EpiState
s0 = (interp, indis, 111)
    -- Le monde reel est 111 car Alice, Bob et Caroline sont tous sales.
  where
    -- Interpretation des mondes
    interp "as" = [100, 101, 110, 111] -- Alice sale
    interp "bs" = [10, 11, 110, 111]   -- Bob sale
    interp "cs" = [1, 11, 101, 111]    -- Caroline sale
    interp _    = []
  
    -- Relations d'indiscernabilité
    -- Alice (a) voit Bob et Caroline, mais ignore son propre état
    indis "a" w | elem w [  0, 100] = [  0, 100] 
                | elem w [  1, 101] = [  1, 101]
                | elem w [ 10, 110] = [ 10, 110]
                | elem w [ 11, 111] = [ 11, 111]
                | otherwise         = [w]
                
    -- Bob (b) voit Alice et Caroline, mais ignore son propre état
    indis "b" w | elem w [  0,  10] = [  0,  10]
                | elem w [  1,  11] = [  1,  11]
                | elem w [100, 110] = [100, 110]
                | elem w [101, 111] = [101, 111]
                | otherwise         = [w]

    -- Caroline (c) voit Alice et Bob, mais ignore son propre état
    indis "c" w | elem w [  0,   1] = [  0,   1]
                | elem w [ 10,  11] = [ 10,  11]
                | elem w [100, 101] = [100, 101]
                | elem w [110, 111] = [110, 111]
                | otherwise         = [w]
                
    indis _ w = [w]

fatherAnn :: EpiFormula
-- Au moins un des trois a le visage sale
fatherAnn = Or (Var "as") (Or (Var "bs") (Var "cs"))

aliceIgn :: EpiFormula
-- Alice ne sait pas si elle est sale, ni si elle est propre
aliceIgn = And (Not (Knows "a" (Var "as"))) (Not (Knows "a" (Not (Var "as"))))

bobIgn :: EpiFormula
-- Bob ne sait pas s'il est sale, ni s'il est propre
bobIgn = And (Not (Knows "b" (Var "bs"))) (Not (Knows "b" (Not (Var "bs"))))

carolineIgn :: EpiFormula
-- Caroline ne sait pas si elle est sale, ni si elle est propre
carolineIgn = And (Not (Knows "c" (Var "cs"))) (Not (Knows "c" (Not (Var "cs"))))

allIgn :: EpiFormula
-- Abréviation pour l'ignorance générale des 3 enfants en même temps
allIgn = And aliceIgn (And bobIgn carolineIgn)

problem3 :: EpiFormula
problem3 =
  After fatherAnn -- L'annonce du père
    (And allIgn   -- 1ère fois : personne ne s'avance (ils sont ignorants)
      (After allIgn -- On met a jour l'état car l'ignorance collective devient publique
        (And allIgn -- 2ème fois : personne ne s'avance toujours pas
          (After allIgn -- On met a jour l'état suite à cette 2ème ignorance générale
            (And (Not aliceIgn) (And (Not bobIgn) (Not carolineIgn))) -- 3ème fois : tous savent !
          )
        )
      )
    )
