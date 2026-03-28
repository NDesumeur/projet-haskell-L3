module P2.ProblemN.Problem2 where
import P2.EL.EL

s0 :: EpiState
s0 = (interp, indis, 11)
  where
    interp "as" = [10, 11]
    interp "bs" = [01, 11]
    interp _    = []
  
    indis "a" w | w == 00 || w == 10 = [00, 10]
                | w == 01 || w == 11 = [01, 11]
    indis "b" w | w == 00 || w == 01 = [00, 01]
                | w == 10 || w == 11 = [10, 11]
    indis _ w = [w]

fatherAnn :: EpiFormula
fatherAnn = Or (Var "as") (Var "bs")

aliceIgn :: EpiFormula
aliceIgn = And (Not (Knows "a" (Var "as"))) (Not (Knows "a" (Not (Var "as"))))

bobIgn :: EpiFormula
bobIgn = And (Not (Knows "b" (Var "bs"))) (Not (Knows "b" (Not (Var "bs"))))

problem2 :: EpiFormula
problem2 = And (And aliceIgn bobIgn) (After fatherAnn (And aliceIgn (After (Knows "b" (Var "bs")) (And (Not aliceIgn) (Not bobIgn)))))
