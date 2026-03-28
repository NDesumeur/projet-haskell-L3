module Problem2 (problem2, s0) where
import EL

s0 :: EpiState
s0 = (interp, indis, 11)
    -- Le monde reel est 11 car dans le probleme 2, Alice et Bob sont TOUS LES DEUX sales.
  where
    interp "as" = [10, 11] -- Alice est sale dans les mondes 10 et 11
    interp "bs" = [01, 11] -- Bob est sale dans les mondes 01 et 11
    interp _    = []
  
    indis "a" w | w == 00 || w == 10 = [00, 10] -- Alice ne voit pas son visage
                | w == 01 || w == 11 = [01, 11]
                | otherwise          = [w]
    indis "b" w | w == 00 || w == 01 = [00, 01] -- Bob ne voit pas son visage
                | w == 10 || w == 11 = [10, 11]
                | otherwise          = [w]
    indis _ w = [w]

fatherAnn :: EpiFormula
fatherAnn = Or (Var "as") (Var "bs")

aliceIgn :: EpiFormula
aliceIgn = And (Not (Knows "a" (Var "as"))) (Not (Knows "a" (Not (Var "as"))))

bobIgn :: EpiFormula
bobIgn = And (Not (Knows "b" (Var "bs"))) (Not (Knows "b" (Not (Var "bs"))))

problem2 :: EpiFormula
problem2 =
  And
    (And aliceIgn bobIgn) -- Etape 1: Au début, les deux sont ignorants
    (After fatherAnn      -- Etape 2: Après l'annonce du père
      (And
        (And aliceIgn bobIgn) -- Etape 3: "Ni Alice ni Bob ne bougent" = tous les deux restent ignorants
        (After (And aliceIgn bobIgn) -- Etape 4: L'annonce implicite que les deux sont ignorants
               (And (Not aliceIgn) (Not bobIgn))))) -- Etape 5: Apres cela, ils font un pas et ne sont plus ignorants
