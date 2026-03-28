module Problem4 (problem4, s0) where

import EL

-- L'état initial où Anne a le nombre 1 et Bill a le nombre 2 (représenté par le monde 12)
s0 :: EpiState
s0 = (interp, indis, 12)
  where
    -- Interprétation: "bX" = Bill a X, "aX" = Anne a X.
    -- Les mondes possibles sont les paires de nombres consécutifs (ex: 12, 21).
    interp "b0" = [10]
    interp "b1" = [1, 21]
    interp "b2" = [12, 32]
    interp "b3" = [23, 43]
    interp "b4" = [34]

    interp "a0" = [1]
    interp "a1" = [10, 12]
    interp "a2" = [21, 23]
    interp "a3" = [32, 34]
    interp "a4" = [43]
    interp _    = []

    -- Indiscernabilité pour Anne : elle connaît son nombre, mais pas celui de Bill.
    -- Ex: Si elle a 1 (mondes 10 ou 12), elle hésite entre ces deux mondes.
    indis "a" w | elem w [  1]      = [  1]
                | elem w [ 10,  12] = [ 10,  12]
                | elem w [ 21,  23] = [ 21,  23]
                | elem w [ 32,  34] = [ 32,  34]
                | elem w [ 43]      = [ 43]
                | otherwise         = [w]

    -- Indiscernabilité pour Bill : il connaît son nombre, mais pas celui d'Anne.
    indis "b" w | elem w [ 10]      = [ 10]
                | elem w [  1,  21] = [  1,  21]
                | elem w [ 12,  32] = [ 12,  32]
                | elem w [ 23,  43] = [ 23,  43]
                | elem w [ 34]      = [ 34]
                | otherwise         = [w]
                
    indis _ w = [w]


-- Formule : "Anne ne connaît pas le nombre de Bill" (elle ne sait pas s'il a 0, 1, 2, 3 ou 4)
anneIgn :: EpiFormula
anneIgn = Not (Or (Knows "a" (Var "b0"))
              (Or (Knows "a" (Var "b1"))
              (Or (Knows "a" (Var "b2"))
              (Or (Knows "a" (Var "b3"))
                  (Knows "a" (Var "b4"))))))

-- Formule : "Bill ne connaît pas le nombre d'Anne"
billIgnorance :: EpiFormula
billIgnorance = Not (Or (Knows "b" (Var "a0"))
                    (Or (Knows "b" (Var "a1"))
                    (Or (Knows "b" (Var "a2"))
                    (Or (Knows "b" (Var "a3"))
                        (Knows "b" (Var "a4"))))))

-- Le déroulement du problème 4
problem4 :: EpiFormula
problem4 =
  And anneIgn                  -- D'abord Anne ne connaît pas le nombre de Bill
    (And billIgnorance         -- Et Bill ne connaît pas le nombre d'Anne
      (After anneIgn           -- Après que Anne annonce son ignorance
        (After billIgnorance   -- Et après que Bill annonce son ignorance
          (Not anneIgn)        -- Finalement, Anne connaît le nombre de Bill
        )
      )
    )
