module P2.EL.EpiState where
import P2.EL.Prop Prop
import P2.EL.Agent Agent
import P2.EL.World World
type EpiState = (Prop -> [World], Agent -> World -> [World], World) -- Pour representer une situation
