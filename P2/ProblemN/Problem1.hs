module P2.ProblemN.Problem1 where
import P2.EL.EL

s0 :: EpiState
s0 = (interp, indis, 01)
    --le premier nombre represente Alice si elle est propre 0 ou sale 1
    --le deuxieme nombre represente Bob si elle est propre 0 ou sale 1
  where
    interp "as" = [10, 11] -- bit de poids le plus fort donc Alice est sale
    interp "bs" = [01, 11] -- bit de poids le plus faible donc Bob est sale
    interp _    = []
  
    indis "a" w | w == 00 || w == 10 = [00, 10]     --Alice ne peut voir son viage donc 
                | w == 01 || w == 11 = [01, 11]     --elle ne sait pas s'il est sale 1 ou propre 0
    indis "b" w | w == 00 || w == 01 = [00, 01]     -- De meme pour Bob
                | w == 10 || w == 11 = [10, 11]
    indis _ w = [w] -- un monde seul est indisernable de lui meme