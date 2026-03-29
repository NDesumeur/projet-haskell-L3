module P2.ProblemN.Problem1 (problem1, s1) where
import P2.EL.EL

s1 :: EpiState
s1 = (interp, indis, 01)
    --le premier nombre represente Alice si elle est propre 0 ou sale 1
    --le deuxieme nombre represente Bob si elle est propre 0 ou sale 1
  where
    interp "as" = [10, 11] -- bit de poids le plus fort donc Alice est sale
    interp "bs" = [01, 11] -- bit de poids le plus faible donc Bob est sale
    interp _    = []
  
    indis "a" w | w == 00 || w == 10 = [00, 10]     --Alice ne peut voir son viage donc 
                | w == 01 || w == 11 = [01, 11]     --elle ne sait pas s'il est sale 1 ou propre 0
                | otherwise          = [w]
    indis "b" w | w == 00 || w == 01 = [00, 01]     -- De meme pour Bob
                | w == 10 || w == 11 = [10, 11]
                | otherwise          = [w]
    indis _ w = [w] -- un monde seul est indisernable de lui meme

fatherAnn :: EpiFormula
fatherAnn = Or (Var "as") (Var "bs")

aliceIgn :: EpiFormula
aliceIgn = And (Not (Knows "a" (Var "as"))) (Not (Knows "a" (Not (Var "as"))))

bobIgn :: EpiFormula
bobIgn = And (Not (Knows "b" (Var "bs"))) (Not (Knows "b" (Not (Var "bs"))))

problem1 :: EpiFormula
problem1 =
  And (And aliceIgn bobIgn) (After fatherAnn (And aliceIgn (After (Knows "b" (Var "bs")) (And (Not aliceIgn) (Not bobIgn)))))